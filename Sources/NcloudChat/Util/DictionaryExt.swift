//
//  DictionaryExt.swift
//  NcloudChatSample
//
//  Created by Han Dole Kim on 12/16/22.
//

import Foundation

extension Dictionary<String, Any> {
    func toJsonString() -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }
}
