//
//  CoreManager.swift
//  CloudChatSample
//
//  Created by Han Dole Kim on 10/13/22.
//
import Foundation
import Apollo
import SocketIO
import AuthenticationServices
import Alamofire
import CoreTelephony
import SystemConfiguration

class CoreManager {
    static let shared = CoreManager()
    private let config: UserDefaults
    private var socketManager: SocketManager?
    private var socket: SocketIOClient?
    weak var delegate: CloudChatDelegate?
    lazy var apollo: ApolloClient = {
        let endpointURL = URL(string: "\(serverURL)/graphql")!
        print("Apollo without token: \(endpointURL)")
        return ApolloClient(url: endpointURL)
    }()
    
    private init() {
        self.config = UserDefaults.standard
        self.delete() // reset token
        self.serverURL = "https://ncloudchat.apigw.ntruss.com/gpapps/v1"
        self.socketURL = "https://soc.ncloudchat.ntruss.com"
    }
    
    public var isSocketExist: Bool {
        get {
            return socket != nil
        }
    }
    
    public var user: User? {
        get {
            do {
                return try config.getObject(forKey: "User", castTo: User.self)
            } catch {
                print(error.localizedDescription)
            }
            return nil
        }
        set(newValue) {
            do {
                try config.setObject(newValue, forKey: "User")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public var token: String {
        get {
            let data = self.read() ?? Data()
            return String(decoding: data, as: UTF8.self)
        }
        set(newValue) {
            let data = Data(newValue.utf8)
            self.save(data)
        }
    }
    
    public var projectId: String? {
        get {
            return config.string(forKey: "projectId") 
        }
        set(newValue) {
            config.set(newValue, forKey: "projectId")
        }
    }
    
    public var language: String? {
        get {
            return config.string(forKey: "language")
        }
        set(newValue) {
            config.set(newValue, forKey: "language")
        }
    }
    
    public var customField: String? {
        get {
            return config.string(forKey: "customField")
        }
        set(newValue) {
            config.set(newValue, forKey: "customField")
        }
    }
    
    public var adid: String? {
        get {
            return config.string(forKey: "adid")
        }
        set(newValue) {
            config.set(newValue, forKey: "adid")
        }
    }
    
    public var serverURL: String {
        get {
            return config.string(forKey: "serverURL") ?? "https://ncloudchat.apigw.ntruss.com/gpapps/v1"
        }
        set(newValue) {
            config.set(newValue, forKey: "serverURL")
        }
    }
    
    public var socketURL: String {
        get {
            return config.string(forKey: "socketURL") ?? "https://soc.ncloudchat.ntruss.com"
        }
        set(newValue) {
            config.set(newValue, forKey: "socketURL")
        }
    }
    
    public var isConnected: Bool {
        get {
            guard let socket = socket else { return false }
            return socket.status == .connected
        }
    }
    
    private func save(_ data: Data, service: String = "token", account: String = "ncloudchat") {
        print("SAVE")
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        let saveStatus = SecItemAdd(query, nil)
        
        if saveStatus != errSecSuccess {
            //            print("Error: \(saveStatus)")
        }
        
        if saveStatus == errSecDuplicateItem {
            update(data, service: service, account: account)
        }
    }
    
    private func update(_ data: Data, service: String = "token", account: String = "ncloudchat") {
        print("UPDATE")
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        let updatedData = [kSecValueData: data] as CFDictionary
        SecItemUpdate(query, updatedData)
    }
    
    private func read(service: String = "token", account: String = "ncloudchat") -> Data? {
        print("READ")
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        return result as? Data
    }
    
    private func delete(service: String = "token", account: String = "ncloudchat") {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        SecItemDelete(query)
    }
    
    private func setEventHandlers() throws {
        guard let socket = socket else { throw CustomError.noSocket }
        socket.removeAllHandlers()
        socket.on(clientEvent: .connect) { dataArray, AckCallback in
            print(self.serverURL)
            print("\(self.socketURL)\(socket.nsp), \(String(describing: socket.handlers.count)) handlers")
            self.delegate?.onConnect?()
        }
        socket.on(clientEvent: .disconnect) { dataArray, AckCallback in
            print(dataArray.jsonValue)
            self.delegate?.onDisconnect?()
        }
        socket.on(clientEvent: .statusChange) { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataArray)
            self.delegate?.onStatusChange?(status: dataInfo)
        }
        socket.on(clientEvent: .reconnect) { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataArray)
            self.delegate?.onReconnect?(data: dataInfo)
        }
        socket.on(clientEvent: .reconnectAttempt) { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataArray)
            self.delegate?.onReconnectAttempt?(data: dataInfo)
        }
        socket.on("message") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onMessage?(data: dataInfo)
        }
        socket.on("start typing") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onStartTyping?(data: dataInfo)
        }
        socket.on("stop typing") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onStopTyping?(data: dataInfo)
        }
        socket.on("event") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
        }
        socket.on("member joined") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onMemberJoined?(data: dataInfo)
        }
        socket.on("member leaved") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onMemberLeaved?(data: dataInfo)
        }
        socket.on("member updated") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onMemberUpdated?(data: dataInfo)
        }
        socket.on("member deleted") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onMemberDeleted?(data: dataInfo)
        }
        socket.on("user banned") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print(dataInfo)
            self.delegate?.onUserBanned?(data: dataInfo)
        }
        socket.on("user deleted") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            self.delegate?.onUserDeleted?(data: dataInfo)
        }
        socket.on("user updated") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            self.delegate?.onUserUpdated?(data: dataInfo)
        }
        socket.on("result") { dataArray, AckCallback in
            guard let dataInfo = dataArray.first else { return }
            print("RESULT")
            print(dataInfo)
            self.delegate?.onResult?(data: dataInfo)
        }
        socket.on(clientEvent: .error) { dataArray, AckCallback in
            self.delegate?.onError?(error: dataArray)
            for dataInfo in dataArray {
                guard let dataString = dataInfo as? String, let data = dataString.data(using: .utf8) else { return }
                let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: AnyObject]
                guard let json = json, let code = json["code"] as? Int else { return }
                if code == 1101 { // handle banned user
                    try? self.disconnectSocket()
                    self.resetApolloToken()
                }
            }
        }
    }
    
    public func resetApolloToken() {
        token = ""
        setApolloToken()
    }
    
    public func getVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    public func getNetworkType() -> String {
        guard let reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, "www.google.com") else {
            return "NO INTERNET"
        }

        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)

        let isReachable = flags.contains(.reachable)
        let isWWAN = flags.contains(.isWWAN)

        if isReachable {
            if isWWAN {
                let networkInfo = CTTelephonyNetworkInfo()
                let carrierType = networkInfo.serviceCurrentRadioAccessTechnology

                guard let carrierTypeName = carrierType?.first?.value else {
                    return "UNKNOWN"
                }

                switch carrierTypeName {
                case CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyCDMA1x:
                    return "2G"
                case CTRadioAccessTechnologyLTE:
                    return "4G"
                default:
                    return "3G"
                }
            } else {
                return "WIFI"
            }
        } else {
            return "NO INTERNET"
        }
    }
    
    public func getDeviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
        return modelCode ?? "";
    }
    
    public func getOSVersion() -> String {
        let os = ProcessInfo().operatingSystemVersion
        
        return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion);
    }
    
    public func connectSocket() throws {
        let url = URL(string: socketURL)
        guard let projectId = projectId else { throw CustomError.notInitialized}
        guard let user = user else { throw CustomError.noUser }
        
        // initialize Socket Manager
        socketManager = SocketManager.init(socketURL: url!, config: [.log(false), .compress, .forceNew(true), .reconnects(true), .reconnectAttempts(20), .reconnectWaitMax(5), .reconnectWait(3), .randomizationFactor(0.5), .forceWebsockets(true), .connectParams(["project_id": projectId, "user_id": user.id, "token": token, "EIO": "3", "customField": customField ?? "", "language": language ?? "en", "image": user.profile, "name": user.name])])
        socket = socketManager?.socket(forNamespace: "/cloudchat")
        
        
        // connect
        guard let socket = socket else { return }
        socket.connect()
        
        
        // set socket event handlers
        do {
            try setEventHandlers()
        } catch {
            return
        }
    }
    
    public func disconnectSocket() throws {
        guard let socket = socket else { throw CustomError.noSocket }
        socket.disconnect()
        socket.removeAllHandlers()
        print("socket disconnect")
    }
    
    public func resetApollo() {
        token = ""
        let endpointURL = URL(string: "\(serverURL)/graphql")!
        self.apollo = ApolloClient(url: endpointURL)
    }
    
    public func setApolloToken() {
        let endpointURL = URL(string: "\(serverURL)/graphql")!
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorProvider(
            interceptors: [TokenInterceptor(token: token)],
            store: store
        )
        print(endpointURL)
        print("apollo token: \(token)")
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvider, endpointURL: endpointURL)
        
        self.apollo = ApolloClient(networkTransport: networkTransport, store: store)
    }
    
    public func emit(emittionType: String, data: Dictionary<String, Any>, completionHandler: @escaping (Result<Any?, CustomError>) -> Void) {
        guard let socket = self.socket, self.isConnected else {
            completionHandler(.failure(CustomError.noSocket))
            return
        }
        socket.emit(emittionType, data)
    }
    
    public func upload(channelId: String, file: Data, fileName: String, mimeType: String, completionHandler: @escaping (Result<Any?, CustomError>) -> Void) {
        if let url = URL(string: "\(serverURL)/upload/\(channelId)") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token)",
                "projectid": projectId!,
                "X-PROJECT-ID": projectId!,
                "Content-Type":"multipart/form-data",
                "Language": language ?? "en"
            ]
            AF.upload(multipartFormData: { multipart in
                multipart.append(channelId.data(using: .utf8)!, withName: "channelId")
                multipart.append("1".data(using: .utf8)!, withName: "upload")
                multipart.append(file, withName: "file", fileName: fileName, mimeType: mimeType)
            }, to: url, headers: headers).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(CustomError.failed(message: error.localizedDescription)))
                }
            }
        }
    }
}
