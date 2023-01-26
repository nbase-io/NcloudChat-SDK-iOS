//
//  CloudChatExtention2.swift
//  CloudChatSample
//
//  Created by Han Dole Kim on 11/7/22.
//

extension CloudChat {
    public func addUsers(channelId: String, memberIds: [String], completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: AddChannelMembersMutation(projectId: projectId, channelId: channelId, memberIds: memberIds)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.addChannelMembers?.channel else {
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
    
    public func removeUsers(channelId: String, memberIds: [String], completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: RemoveChannelMembersMutation(projectId: projectId, channelId: channelId, memberIds: memberIds)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.removeChannelMembers?.channel else {
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
    
    
    public func getUsers(filter: Dictionary<String, Any>, sort: Dictionary<String, Any>?, option: Dictionary<String, Any>, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: MembersForQueryQuery(projectId: projectId, option: option.toJsonString()!, filter: filter.toJsonString()!, sort: sort?.toJsonString())) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var members = graphQLResult.data?.membersForQuery else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<members.totalCount {
                    if let node = members.edges?[i]?.node {
                        members.edges?[i]?.node?.id = node.id.toDecodedId()
                    }
                }
                completionHandler(.success(members.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func banUser(channelId: String, memberId: String, options: Dictionary<String, Any>, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: CreateMemberBlockMutation(projectId: projectId, memberId: memberId, channelId: channelId, options: options.toJsonString())) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.createMemberBlock?.memberBlock else {
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
    
    
    public func unbanUser(channelId: String, memberId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        guard !channelId.isEmpty else {
            completionHandler(.failure(.noChannelId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: DeleteMemberBlockMutation(projectId: projectId, memberId: memberId, channelId: channelId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.deleteMemberBlock?.memberBlock else {
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
    
    
    public func getFriendships(filter: Dictionary<String, Any>, sort: Dictionary<String, Any>?, option: Dictionary<String, Any>?, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(CustomError.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.fetch(query: FriendshipsQuery(projectId: projectId, filter: filter.toJsonString()!, sort: sort?.toJsonString(), option: option?.toJsonString()), cachePolicy:.fetchIgnoringCacheData) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var friendships = graphQLResult.data?.friendships else {
                    completionHandler(.success(nil))
                    return
                }
                for i in 0..<friendships.totalCount {
                    if let user = friendships.edges?[i]?.node?.user, let friend = friendships.edges?[i]?.node?.friend {
                        friendships.edges?[i]?.node?.user?.id = user.id.toDecodedId()
                        friendships.edges?[i]?.node?.friend?.id = friend.id.toDecodedId()
                    }
                }
                completionHandler(.success(friendships.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func requestFriendship(friendId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: RequestFriendMutation(projectId: projectId, friendId: friendId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.requestFriend else {
                    completionHandler(.success(nil))
                    return
                }
                if let user = data.friendship?.user, let friend = data.friendship?.friend {
                    data.friendship?.user?.id = user.id.toDecodedId()
                    data.friendship?.friend?.id = friend.id.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func acceptFriendship(friendId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: AcceptFriendMutation(projectId: projectId, friendId: friendId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.acceptFriend else {
                    completionHandler(.success(nil))
                    return
                }
                if let user = data.friendship?.user, let friend = data.friendship?.friend {
                    data.friendship?.user?.id = user.id.toDecodedId()
                    data.friendship?.friend?.id = friend.id.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func rejectFriendship(friendId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void)  {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: RejectFriendMutation(projectId: projectId, friendId: friendId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.rejectFriend else {
                    completionHandler(.success(nil))
                    return
                }
                if let user = data.friendship?.user, let friend = data.friendship?.friend {
                    data.friendship?.user?.id = user.id.toDecodedId()
                    data.friendship?.friend?.id = friend.id.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
    
    
    public func deleteFriendship(friendId: String, completionHandler: @escaping (CustomResult<Any?, CustomError>) -> Void) {
        guard let projectId = CoreManager.shared.projectId, !projectId.isEmpty else {
            completionHandler(.failure(.noProjectId))
            return
        }
        
        CoreManager.shared.apollo.perform(mutation: RemoveFriendMutation(projectId: projectId, friendId: friendId)) {
            result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    completionHandler(.failure(.failed(message: errors.description)))
                }
                guard var data = graphQLResult.data?.removeFriend else {
                    completionHandler(.success(nil))
                    return
                }
                if let user = data.friendship?.user, let friend = data.friendship?.friend {
                    data.friendship?.user?.id = user.id.toDecodedId()
                    data.friendship?.friend?.id = friend.id.toDecodedId()
                }
                completionHandler(.success(data.resultMap.jsonValue))
            case .failure(let error):
                completionHandler(.failure(.failed(message: error.localizedDescription)))
            }
        }
    }
}
