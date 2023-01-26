//
//  StringExt.swift
//  NcloudChatSample
//
//  Created by Han Dole Kim on 11/30/22.
//

import Foundation

extension String {
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
    
    func toDecodedId() -> String {
        return fromBase64()?.components(separatedBy: ":")[1] ?? self
    }
    
    func toDate() -> Date? {
        guard !self.isEmpty else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'+09:00'"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        return dateFormatter.date(from: self)
    }
}
