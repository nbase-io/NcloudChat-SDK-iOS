//
//  CloudChatExtention.swift
//  CloudChatSample
//
//  Created by Han Dole Kim on 11/7/22.
//

import UIKit

extension CloudChat {
    public func sendMessage(channelId: String, message: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !message.isEmpty else {
            completionHandler(.failure(.noMessage))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: CreateChannelMessageMutation(projectId: projectId, channelId: channelId, content: message)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.createChannelMessage?.message else {
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
    
    public func sendExpressMessage(channelId: String, message: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !message.isEmpty else {
            completionHandler(.failure(.noMessage))
            return
        }
        guard let user = CoreManager.shared.user else {
            completionHandler(.failure(.noUserId))
            return
        }
        
        let userData = ["id": user.id, "name": user.name, "profile": user.profile]
        let data: Dictionary<String, Any> = ["channelId": channelId, "type": "text", "message": message, "user": userData]
        CoreManager.shared.emit(emittionType: "express message", data: data) {
            result in
            switch result {
            case .success(let socketResult):
                completionHandler(.success(socketResult))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func sendImage(channelId: String, file: Data, fileName: String, mimeType: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !file.isEmpty else {
            completionHandler(.failure(.noFile))
            return
        }
        guard !fileName.isEmpty else {
            completionHandler(.failure(.noFileName))
            return
        }
        guard !mimeType.isEmpty else {
            completionHandler(.failure(.noMimeType))
            return
        }
        guard mimeType == "image/bmp" || mimeType == "image/gif" || mimeType == "image/jpeg" || mimeType == "image/png" || mimeType == "image/webp" || mimeType == "image/heic" || mimeType == "image/heic-sequence" || mimeType == "image/heif" || mimeType == "image/heif-sequence" || mimeType == "image/svg+xml"  else {
            completionHandler(.failure(.failed(message: "Unsupported mime type, supported types are: image/bmp, image/gif, image/jpeg, image/png, image/webp, image/heic, image/heic-sequence, image/heif, image/heif-sequence, image/svg+xml.")))
            return
        }
        
        CoreManager.shared.upload(channelId: channelId, file: file, fileName: fileName, mimeType: mimeType) { result in
            switch result {
            case .success(let data):
                completionHandler(.success(String(describing: data)))
            case .failure(let error):
                print("nc fail \(error.localizedDescription)")
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func startTyping(channelId: String, threadId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !threadId.isEmpty else {
            completionHandler(.failure(.noThreadId))
            return
        }
        
        let data: Dictionary<String, Any> = ["channelId": channelId, "threadId": threadId]
        CoreManager.shared.emit(emittionType: "start typing", data: data) {
            result in
            switch result {
            case .success(let socketResult):
                completionHandler(.success(socketResult))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func stopTyping(channelId: String, threadId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !threadId.isEmpty else {
            completionHandler(.failure(.noThreadId))
            return
        }
        
        let data = ["channelId": channelId, "threadId": threadId]
        CoreManager.shared.emit(emittionType: "stop typing", data: data) { result in
            switch result {
            case .success(let socketResult):
                completionHandler(.success(socketResult))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func markRead(channelId: String, userId: String, messageId: String, sortId: String, option: String? = "{}", completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        let mark = MarkInput(userId: userId, messageId: messageId, sortId: sortId)
        
        CoreManager.shared.apollo.perform(mutation: UpdateSubscriptionMutation(projectId: projectId, channelId: channelId, mark: mark, option: option ?? "{}")) {
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
    
    
    public func getMessage(channelId: String, messageId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard !messageId.isEmpty else {
            completionHandler(.failure(.noMessage))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: MessageQuery(projectId: projectId, channelId: channelId, id: messageId), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.message else {
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
    
    
    public func getMessages(filter: Dictionary<String, Any>, sort: Dictionary<String, Any>?, option: Dictionary<String, Any>?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: MessagesQuery(projectId: projectId, filter: filter.toJsonString()!, option: option?.toJsonString(), sort: sort?.toJsonString()), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var messages = graphQLResult.data?.messages else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<messages.totalCount {
                    if let node = messages.edges?[i]?.node {
                        messages.edges?[i]?.node?.id = node.id.toDecodedId()
                    }
                }
                completionHandler(.success(messages.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func unreadCount(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: MarkQuery(projectId: projectId, channelId: channelId), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard let data = graphQLResult.data?.mark else {
                    completionHandler(.success(nil))
                    return
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func getChannel(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: ChannelQuery(id: channelId, projectId: projectId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.channel else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.user?.id {
                    data.user?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func getChannels(filter: Dictionary<String, Any>?, sort: Dictionary<String, Any>?, option: Dictionary<String, Any>?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: ChannelsQuery(projectId: projectId, filter: (filter?.toJsonString())!, sort: sort?.toJsonString(), option: option?.toJsonString())) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var channels = graphQLResult.data?.channels else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<channels.totalCount {
                    if let node = channels.edges?[i]?.node, let user = node.user {
                        channels.edges?[i]?.node?.id = node.id.toDecodedId()
                        channels.edges?[i]?.node?.user?.id = user.id.toDecodedId()
                    }
                }
                completionHandler(.success(channels.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func createChannel(channelType: String, channelName: String, uniqueId: String? = nil, members: [String]? = [], customField: String? = "", disabled: Bool? = nil, mutes: Bool? = nil, push: Bool? = nil, imageUrl: String? = nil, id: String? = nil, translation: Bool? = nil, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelType.isEmpty else {
            completionHandler(.failure(.noChannelType))
            return
        }
        guard channelType.uppercased() == "PUBLIC" || channelType.uppercased() == "PRIVATE" else {
            completionHandler(.failure(.failed(message: "Channel type only can be public or private.")))
            return
        }
        guard !channelName.isEmpty else {
            completionHandler(.failure(.noChannelName))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: CreateChannelMutation(id: id, projectId: projectId, name: channelName, type: channelType.uppercased(), uniqueId: uniqueId, translation: translation, push: push, mutes: mutes, linkUrl: "", imageUrl: imageUrl, customField: customField, members: members)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.createChannel?.channel else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.user?.id {
                    data.user?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func updateChannel(channelId: String, channelType: String?, channelName: String?, translation: Bool?, push: Bool?, imageUrl: String?, members: [String?]?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        guard let channelType = channelType, !channelType.isEmpty else {
            completionHandler(.failure(.noChannelType))
            return
        }
        guard channelType.uppercased() == "PUBLIC" || channelType.uppercased() == "PRIVATE" else {
            completionHandler(.failure(.failed(message: "Channel type only can be public or private.")))
            return
        }
        guard let channelName = channelName, !channelName.isEmpty else {
            completionHandler(.failure(.noChannelName))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: UpdateChannelMutation(projectId: projectId, name: channelName, type: channelType.uppercased(), uniqueId: channelId, translation: translation, push: push, imageUrl: imageUrl, id: channelId, members: members)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.updateChannel?.channel else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.user?.id {
                    data.user?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func deleteChannel(channelId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: DeleteChannelMutation(projectId: projectId, id: channelId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.deleteChannel?.channel else {
                    completionHandler(.success(nil))
                    return
                }
                data.id = data.id.toDecodedId()
                if let userId = data.user?.id {
                    data.user?.id = userId.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
}
