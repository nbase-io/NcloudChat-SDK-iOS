//
//  CloudChatExtention3.swift
//  CloudChat
//
//  Created by Han Dole Kim on 12/20/22.
//

extension CloudChat {
    /*
    public func getPin(id: String, channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !id.isEmpty else {
            completionHandler(.failure(.failed(message: "Please provide a pin id.")))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: PinQuery(projectId: projectId, channelId: channelId, id: id), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.pin else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.userId?.id {
                    data.userId?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func getPins(channelId: String, filter: Dictionary<String, Any>, option: Dictionary<String, Any>?, sort: Dictionary<String, Any>?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: PinsQuery(projectId: projectId, channelId: channelId, filter: filter.toJsonString()!, option: option?.toJsonString(), sort: sort?.toJsonString()), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var pins = graphQLResult.data?.pins else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<pins.totalCount {
                    if let node = pins.edges?[i]?.node, let userId = node.userId {
                        pins.edges?[i]?.node?.id = node.id.toDecodedId()
                        pins.edges?[i]?.node?.userId?.id = userId.id.toDecodedId()
                    }
                }
                completionHandler(.success(pins.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func createPin(channelId: String, pinned: Bool, pinnedAt: String?, expiredAt: String?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: CreatePinMutation(projectId: projectId, channelId: channelId, pinned: pinned, pinnedAt: pinnedAt, expiredAt: expiredAt)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.createPin?.pin else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.userId?.id {
                    data.userId?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func updatePin(id: String, channelId: String, pinned: Bool, pinnedAt: String?, expiredAt: String?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !id.isEmpty else {
            completionHandler(.failure(.noPinId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: UpdatePinMutation(id: id, projectId: projectId, channelId: channelId, pinned: pinned, pinnedAt: pinnedAt, expiredAt: expiredAt)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.updatePin?.pin else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.userId?.id {
                    data.userId?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    */
    public static func applicationWillEnterForeground() {
        if CoreManager.shared.isSocketExist, !CoreManager.shared.token.isEmpty {
            try? CoreManager.shared.connectSocket()
        }
    }
    
    public static func applicationDidEnterBackground() {
        if CoreManager.shared.isSocketExist, !CoreManager.shared.token.isEmpty {
            try? CoreManager.shared.disconnectSocket()
        }
    }
}
