//
//  TokenInterceptor.swift
//  NcloudChatSample
//
//  Created by Han Dole Kim on 10/24/22.
//

import Apollo

class TokenInterceptor: ApolloInterceptor {
    
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
            request.addHeader(name: "Language", value: CoreManager.shared.language!)
            chain.proceedAsync(request: request, response: response, completion: completion)
    }
    
}
