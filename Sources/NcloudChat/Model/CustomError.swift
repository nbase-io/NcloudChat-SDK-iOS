//
//  NcloudChatError.swift
//  NcloudChat
//
//  Created by Han Dole Kim on 1/19/23.
//

import Foundation


public enum CustomError: Error {
    case failToConnect
    case failToDisconnect
    case noProjectId
    case noSocket
    case noFile
    case noFileName
    case noMimeType
    case noMessage
    case noThreadId
    case noUser
    case noUserId
    case noChannelId
    case noChannelType
    case noChannelName
    case noSubscriptionId
    case noPinId
    case notInitialized
    case failed(message: String)
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failToConnect:
            return NSLocalizedString("Failed to connect, please try again.", comment: "Fail To Connect")
        case .failToDisconnect:
            return NSLocalizedString("Failed to disconnect, please try again.", comment: "Fail To Disconnect")
        case .noProjectId:
            return NSLocalizedString("Please input a project id.", comment: "No Project ID")
        case .noSocket:
            return NSLocalizedString("Please connect before run the methods.", comment: "No Socket Connection Found")
        case .noFile:
            return NSLocalizedString("Please provide a file.", comment: "No File")
        case .noFileName:
            return NSLocalizedString("Please provide a file name.", comment: "No File Name")
        case .noMimeType:
            return NSLocalizedString("Please provide a mime type.", comment: "No Mime Type")
        case .noMessage:
            return NSLocalizedString("Please provide a context of the message.", comment: "No Message")
        case .noThreadId:
            return NSLocalizedString("Please provide a thread id of the message (thread id is the message id).", comment: "No Thread ID")
        case .noUser:
            return NSLocalizedString("Please provide a user informations.", comment: "No User Information")
        case .noUserId:
            return NSLocalizedString("Please provide a user id.", comment: "No User ID")
        case .noChannelId:
            return NSLocalizedString("Please provide a channel id.", comment: "No Channel ID")
        case .noChannelType:
            return NSLocalizedString("Please provide a channel type (private or public).", comment: "No Channel Type")
        case .noChannelName:
            return NSLocalizedString("Please provide a channel name.", comment: "No Channel Name")
        case .noSubscriptionId:
            return NSLocalizedString("Please provide a subscription id.", comment: "No Subscription ID")
        case .noPinId:
            return NSLocalizedString("Please provide a pin id.", comment: "No Pin ID")
        case .notInitialized:
            return NSLocalizedString("Please initialize before connecting.", comment: "Initialization Required")
        case .failed(let message):
            return NSLocalizedString(message, comment: "Unexpected Error")
        }
    }
}
