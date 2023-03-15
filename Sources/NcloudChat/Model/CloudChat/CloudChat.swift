//
//  CloudChat.swift
//  CloudChatSample
//
//  Created by Han Dole Kim on 10/13/22.
//

import UIKit

public class CloudChat {
    
    public init(projectId: String, language: String = "en", completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        CoreManager.shared.projectId = projectId
        CoreManager.shared.language = language.isEmpty ? "en" : language
        completionHandler(.success("NcloudChat initialized: \(String(describing: CoreManager.shared.projectId))) \(String(describing: CoreManager.shared.language))"))
    }
    
    deinit {
        do {
            print("deinit: \(String(describing: CoreManager.shared.user))")
            try CoreManager.shared.disconnectSocket()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func setDelegate(delegate: CloudChatDelegate) {
        CoreManager.shared.delegate = delegate
    }
    
    public static func setServerURL(url: String) {
        CoreManager.shared.serverURL = url
    }
    
    public static func setSocketURL(url: String) {
        CoreManager.shared.socketURL = url
    }
    
    public static func setPushToken(deviceToken: Data) {
        let pushTokenString = deviceToken.map{ data in String(format: "%02.2hhx", data) }.joined()
        CoreManager.shared.pushToken = pushTokenString
    }
    
    public func isConnected() -> Bool {
        return CoreManager.shared.isConnected
    }
    
    public func connect(userId: String!, userToken: String = "", name: String = "", profile: String = "", customField: String = "", completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        // disconnect if connection is already made
        if(CoreManager.shared.isConnected) {
            disconnect { result in
                switch result {
                case .success:
                    break
                case .failure:
                    completionHandler(.failure(.failToConnect))
                    return
                }
            }
        }
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !userId.isEmpty else {
            completionHandler(.failure(.noUserId))
            return
        }
        
        // save user
        CoreManager.shared.user = User(id: userId, name: name, profile: profile)
        
        // set token
        CoreManager.shared.token = userToken
        CoreManager.shared.setApolloToken()
        
        // set custom field
        CoreManager.shared.customField = customField
        
        // connect a server to get a token
        CoreManager.shared.apollo.perform(mutation: LoginMutation(projectId: projectId, userId: userId, name: name, profile: profile, customField: customField)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                    return
                }
                if ((graphQLResult.data?.login?.token) != nil) {
                    CoreManager.shared.token = (graphQLResult.data?.login?.token)!
                    CoreManager.shared.setApolloToken()
                    let uuid = UIDevice.current.identifierForVendor?.uuidString
                    
                    // update member info
                    CoreManager.shared.apollo.perform(mutation: UpdateMemberMutation(id: userId, projectId: projectId, name: name, profile: profile, remoteip: "", memo: "", adid: uuid, device: CoreManager.shared.getOSVersion(), deviceType: ["iOS"], network: CoreManager.shared.getNetworkType(), version: CoreManager.shared.getVersion(), model: CoreManager.shared.getDeviceModel(), notications: NoticationInput(token: CoreManager.shared.pushToken, device: "APNS", os: "ios"))) {
                        result in
                        switch result {
                        case .success(let graphQLResult):
                            if let errors = graphQLResult.errors {
                                completionHandler(.failure(.failed(message: errors.description)))
                            }
                            // connect socket
                            do {
                                try CoreManager.shared.connectSocket()
                                completionHandler(.success("Connected:  \(CoreManager.shared.token)"))
                            } catch {
                                completionHandler(.failure(.failToConnect))
                                return
                            }
                            
                        case .failure(let error):
                            completionHandler(.failure(.failed(message: error.localizedDescription)))
                            return
                        }
                    }
                }
            case .failure(let error):
                // reset token
                CoreManager.shared.resetApolloToken()
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    public func disconnect(completionHandler: @escaping (CustomResult<Any, CustomError>) -> Void) {
        do {
            try CoreManager.shared.disconnectSocket()
            CoreManager.shared.resetApollo()
            CoreManager.shared.delegate?.onDisconnect?()
            completionHandler(.success("Disconnected"))
        } catch {
            completionHandler(.failure(.failToDisconnect))
        }
    }
    
    
    public func subscribe(channelId: String, options: String? = "", completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: CreateSubscriptionMutation(projectId: projectId, channelId: channelId, option: options)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.createSubscription?.subscription else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func unsubscribe(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: DeleteSubscriptionMutation(projectId: projectId, channelId: channelId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.deleteSubscription?.subscription else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func getSubscription(channelId: String, subscriptionId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !subscriptionId.isEmpty else {
            completionHandler(.failure(.noSubscriptionId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: SubscriptionQuery(projectId: projectId, channelId: channelId, id: subscriptionId), cachePolicy:.fetchIgnoringCacheData) { result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.subscription else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func getSubscriptions(filter: Dictionary<String, Any>, option: Dictionary<String, Any>, sort: Dictionary<String, Any>, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: SubscriptionsQuery(projectId: projectId, option: option.toJsonString() ?? "", filter: filter.toJsonString() ?? "", sort: sort.toJsonString() ?? ""), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var subscriptions = graphQLResult.data?.subscriptions else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<subscriptions.totalCount {
                    if let node = subscriptions.edges?[i]?.node {
                        subscriptions.edges?[i]?.node?.id = node.id.toDecodedId()
                    }
                }
                completionHandler(.success(subscriptions.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func mute(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: UpdateSubscriptionMutation(projectId: projectId, channelId: channelId, option: "{\"mute\":true}")) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.updateSubscription?.subscription else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func unmute(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: UpdateSubscriptionMutation(projectId: projectId, channelId: channelId, option: "{\"mute\":false}")) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.updateSubscription?.subscription else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
}
