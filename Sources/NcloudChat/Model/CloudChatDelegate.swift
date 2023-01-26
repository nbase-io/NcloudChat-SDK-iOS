//
//  NcloudChatEvent.swift
//  NcloudChatSample
//
//  Created by Han Dole Kim on 10/25/22.
//

import Foundation

@objc
public protocol CloudChatDelegate {
    /// Emitted when the client connects. This is also called on a successful reconnection. A connect event gets one
    @objc optional func onConnect()
    /// Emitted when the socket has disconnected and will not attempt to try to reconnect.
    @objc optional func onDisconnect()
    /// Emitted every time there is a change in the client's status.
    @objc optional func onStatusChange(status: Any)
    @objc optional func onMessage(data: Any)
    @objc optional func onStartTyping(data: Any)
    @objc optional func onStopTyping(data: Any)
    @objc optional func onEvent(data: Any)
    @objc optional func onMemberJoined(data: Any)
    @objc optional func onMemberLeaved(data: Any)
    @objc optional func onMemberUpdated(data: Any)
    @objc optional func onMemberDeleted(data: Any)
    @objc optional func onUserBanned(data: Any)
    @objc optional func onUserDeleted(data: Any)
    @objc optional func onUserUpdated(data: Any)
    /// Emitted when the client begins the reconnection process.
    @objc optional func onReconnect(data: Any)
    /// Emitted each time the client tries to reconnect to the server.
    @objc optional func onReconnectAttempt(data: Any)
    @objc optional func onResult(data: Any)
    @objc optional func onError(error: Any)
}
