// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct NoticationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - token
  ///   - device
  ///   - os
  public init(token: Swift.Optional<String?> = nil, device: Swift.Optional<String?> = nil, os: Swift.Optional<String?> = nil) {
    graphQLMap = ["token": token, "device": device, "os": os]
  }

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var device: Swift.Optional<String?> {
    get {
      return graphQLMap["device"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device")
    }
  }

  public var os: Swift.Optional<String?> {
    get {
      return graphQLMap["os"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "os")
    }
  }
}

public struct MarkInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - userId
  ///   - messageId
  ///   - sortId
  public init(userId: Swift.Optional<String?> = nil, messageId: Swift.Optional<String?> = nil, sortId: Swift.Optional<String?> = nil) {
    graphQLMap = ["user_id": userId, "message_id": messageId, "sort_id": sortId]
  }

  public var userId: Swift.Optional<String?> {
    get {
      return graphQLMap["user_id"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_id")
    }
  }

  public var messageId: Swift.Optional<String?> {
    get {
      return graphQLMap["message_id"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "message_id")
    }
  }

  public var sortId: Swift.Optional<String?> {
    get {
      return graphQLMap["sort_id"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort_id")
    }
  }
}

public final class ChannelQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query channel($id: String, $projectId: String!) {
      channel(projectId: $projectId, id: $id) {
        __typename
        id
        project_id
        name
        user_id
        user {
          __typename
          id
          name
          profile
          device_type
          language
        }
        unique_id
        type
        translation
        members
        push
        link_url
        image_url
        created_at
        updated_at
        last_message {
          __typename
          message_id
          sort_id
          project_id
          channel_id
          message_type
          mentions
          mentions_everyone
          has
          sender {
            __typename
            id
            name
            profile
          }
          admin {
            __typename
            id
            name
            profile
          }
          content
          created_at
        }
      }
    }
    """

  public let operationName: String = "channel"

  public var id: String?
  public var projectId: String

  public init(id: String? = nil, projectId: String) {
    self.id = id
    self.projectId = projectId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "projectId": projectId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("channel", arguments: ["projectId": GraphQLVariable("projectId"), "id": GraphQLVariable("id")], type: .object(Channel.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channel: Channel? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
    }

    public var channel: Channel? {
      get {
        return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "channel")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Channels"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("project_id", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("unique_id", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("translation", type: .scalar(Bool.self)),
          GraphQLField("members", type: .list(.scalar(String.self))),
          GraphQLField("push", type: .scalar(Bool.self)),
          GraphQLField("link_url", type: .scalar(String.self)),
          GraphQLField("image_url", type: .scalar(String.self)),
          GraphQLField("created_at", type: .scalar(String.self)),
          GraphQLField("updated_at", type: .scalar(String.self)),
          GraphQLField("last_message", type: .object(LastMessage.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, lastMessage: LastMessage? = nil) {
        self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt, "last_message": lastMessage.flatMap { (value: LastMessage) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var projectId: String? {
        get {
          return resultMap["project_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "project_id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var uniqueId: String? {
        get {
          return resultMap["unique_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "unique_id")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var translation: Bool? {
        get {
          return resultMap["translation"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "translation")
        }
      }

      public var members: [String?]? {
        get {
          return resultMap["members"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "members")
        }
      }

      public var push: Bool? {
        get {
          return resultMap["push"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "push")
        }
      }

      public var linkUrl: String? {
        get {
          return resultMap["link_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "link_url")
        }
      }

      public var imageUrl: String? {
        get {
          return resultMap["image_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image_url")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["created_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created_at")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updated_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updated_at")
        }
      }

      public var lastMessage: LastMessage? {
        get {
          return (resultMap["last_message"] as? ResultMap).flatMap { LastMessage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "last_message")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Members"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
            GraphQLField("device_type", type: .list(.scalar(String.self))),
            GraphQLField("language", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }

        /// 디바이스타입 [gcm,apns]
        public var deviceType: [String?]? {
          get {
            return resultMap["device_type"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "device_type")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }
      }

      public struct LastMessage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Messages"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_type", type: .scalar(String.self)),
            GraphQLField("mentions", type: .list(.scalar(String.self))),
            GraphQLField("mentions_everyone", type: .scalar(String.self)),
            GraphQLField("has", type: .scalar(String.self)),
            GraphQLField("sender", type: .object(Sender.selections)),
            GraphQLField("admin", type: .object(Admin.selections)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(messageId: String, sortId: String, projectId: String, channelId: String, messageType: String? = nil, mentions: [String?]? = nil, mentionsEveryone: String? = nil, has: String? = nil, sender: Sender? = nil, admin: Admin? = nil, content: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Messages", "message_id": messageId, "sort_id": sortId, "project_id": projectId, "channel_id": channelId, "message_type": messageType, "mentions": mentions, "mentions_everyone": mentionsEveryone, "has": has, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "content": content, "created_at": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var messageId: String {
          get {
            return resultMap["message_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var sortId: String {
          get {
            return resultMap["sort_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sort_id")
          }
        }

        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var messageType: String? {
          get {
            return resultMap["message_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_type")
          }
        }

        public var mentions: [String?]? {
          get {
            return resultMap["mentions"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions")
          }
        }

        public var mentionsEveryone: String? {
          get {
            return resultMap["mentions_everyone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions_everyone")
          }
        }

        public var has: String? {
          get {
            return resultMap["has"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "has")
          }
        }

        public var sender: Sender? {
          get {
            return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "sender")
          }
        }

        public var admin: Admin? {
          get {
            return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "admin")
          }
        }

        public var content: String? {
          get {
            return resultMap["content"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Admin: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class ChannelsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query channels($projectId: String!, $filter: String!, $sort: String, $option: String) {
      channels(projectId: $projectId, filter: $filter, sort: $sort, option: $option) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            id
            project_id
            name
            user_id
            user {
              __typename
              id
              name
              profile
              device_type
              language
            }
            unique_id
            type
            translation
            members
            push
            link_url
            image_url
            created_at
            updated_at
            last_message {
              __typename
              message_id
              sort_id
              project_id
              channel_id
              message_type
              mentions
              mentions_everyone
              has
              sender {
                __typename
                id
                name
                profile
              }
              admin {
                __typename
                id
                name
                profile
              }
              content
              created_at
            }
          }
        }
      }
    }
    """

  public let operationName: String = "channels"

  public var projectId: String
  public var filter: String
  public var sort: String?
  public var option: String?

  public init(projectId: String, filter: String, sort: String? = nil, option: String? = nil) {
    self.projectId = projectId
    self.filter = filter
    self.sort = sort
    self.option = option
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "filter": filter, "sort": sort, "option": option]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("channels", arguments: ["projectId": GraphQLVariable("projectId"), "filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort"), "option": GraphQLVariable("option")], type: .object(Channel.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channels: Channel? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "channels": channels.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
    }

    public var channels: Channel? {
      get {
        return (resultMap["channels"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "channels")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ChannelsConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ChannelsConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ChannelsEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "ChannelsEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Channels"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("project_id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("user_id", type: .scalar(String.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("unique_id", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("translation", type: .scalar(Bool.self)),
              GraphQLField("members", type: .list(.scalar(String.self))),
              GraphQLField("push", type: .scalar(Bool.self)),
              GraphQLField("link_url", type: .scalar(String.self)),
              GraphQLField("image_url", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
              GraphQLField("updated_at", type: .scalar(String.self)),
              GraphQLField("last_message", type: .object(LastMessage.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, lastMessage: LastMessage? = nil) {
            self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt, "last_message": lastMessage.flatMap { (value: LastMessage) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var projectId: String? {
            get {
              return resultMap["project_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var userId: String? {
            get {
              return resultMap["user_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user_id")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var uniqueId: String? {
            get {
              return resultMap["unique_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "unique_id")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var translation: Bool? {
            get {
              return resultMap["translation"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "translation")
            }
          }

          public var members: [String?]? {
            get {
              return resultMap["members"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "members")
            }
          }

          public var push: Bool? {
            get {
              return resultMap["push"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "push")
            }
          }

          public var linkUrl: String? {
            get {
              return resultMap["link_url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "link_url")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["image_url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image_url")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public var updatedAt: String? {
            get {
              return resultMap["updated_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updated_at")
            }
          }

          public var lastMessage: LastMessage? {
            get {
              return (resultMap["last_message"] as? ResultMap).flatMap { LastMessage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "last_message")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Members"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
                GraphQLField("device_type", type: .list(.scalar(String.self))),
                GraphQLField("language", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }

            /// 디바이스타입 [gcm,apns]
            public var deviceType: [String?]? {
              get {
                return resultMap["device_type"] as? [String?]
              }
              set {
                resultMap.updateValue(newValue, forKey: "device_type")
              }
            }

            public var language: String? {
              get {
                return resultMap["language"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "language")
              }
            }
          }

          public struct LastMessage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Messages"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
                GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
                GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
                GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
                GraphQLField("message_type", type: .scalar(String.self)),
                GraphQLField("mentions", type: .list(.scalar(String.self))),
                GraphQLField("mentions_everyone", type: .scalar(String.self)),
                GraphQLField("has", type: .scalar(String.self)),
                GraphQLField("sender", type: .object(Sender.selections)),
                GraphQLField("admin", type: .object(Admin.selections)),
                GraphQLField("content", type: .scalar(String.self)),
                GraphQLField("created_at", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(messageId: String, sortId: String, projectId: String, channelId: String, messageType: String? = nil, mentions: [String?]? = nil, mentionsEveryone: String? = nil, has: String? = nil, sender: Sender? = nil, admin: Admin? = nil, content: String? = nil, createdAt: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Messages", "message_id": messageId, "sort_id": sortId, "project_id": projectId, "channel_id": channelId, "message_type": messageType, "mentions": mentions, "mentions_everyone": mentionsEveryone, "has": has, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "content": content, "created_at": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var messageId: String {
              get {
                return resultMap["message_id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message_id")
              }
            }

            public var sortId: String {
              get {
                return resultMap["sort_id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "sort_id")
              }
            }

            public var projectId: String {
              get {
                return resultMap["project_id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "project_id")
              }
            }

            public var channelId: String {
              get {
                return resultMap["channel_id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "channel_id")
              }
            }

            public var messageType: String? {
              get {
                return resultMap["message_type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message_type")
              }
            }

            public var mentions: [String?]? {
              get {
                return resultMap["mentions"] as? [String?]
              }
              set {
                resultMap.updateValue(newValue, forKey: "mentions")
              }
            }

            public var mentionsEveryone: String? {
              get {
                return resultMap["mentions_everyone"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mentions_everyone")
              }
            }

            public var has: String? {
              get {
                return resultMap["has"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "has")
              }
            }

            public var sender: Sender? {
              get {
                return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "sender")
              }
            }

            public var admin: Admin? {
              get {
                return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "admin")
              }
            }

            public var content: String? {
              get {
                return resultMap["content"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "content")
              }
            }

            public var createdAt: String? {
              get {
                return resultMap["created_at"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "created_at")
              }
            }

            public struct Sender: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Sender"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(String.self)),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("profile", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String? {
                get {
                  return resultMap["id"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var profile: String? {
                get {
                  return resultMap["profile"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profile")
                }
              }
            }

            public struct Admin: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Sender"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(String.self)),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("profile", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String? {
                get {
                  return resultMap["id"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var profile: String? {
                get {
                  return resultMap["profile"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profile")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateChannelMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createChannel($id: String, $projectId: String!, $name: String!, $type: String!, $uniqueId: String, $translation: Boolean, $push: Boolean, $mutes: Boolean, $linkUrl: String, $imageUrl: String, $customField: String, $members: [String]) {
      createChannel(
        input: {id: $id, projectId: $projectId, name: $name, type: $type, uniqueId: $uniqueId, translation: $translation, push: $push, mutes: $mutes, customField: $customField, linkUrl: $linkUrl, imageUrl: $imageUrl, members: $members}
      ) {
        __typename
        channel {
          __typename
          id
          project_id
          name
          user_id
          user {
            __typename
            id
            name
            profile
            device_type
            language
          }
          unique_id
          type
          translation
          members
          push
          link_url
          image_url
          created_at
          updated_at
          last_message {
            __typename
            message_id
            sort_id
            project_id
            channel_id
            message_type
            mentions
            mentions_everyone
            has
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            content
            created_at
          }
        }
      }
    }
    """

  public let operationName: String = "createChannel"

  public var id: String?
  public var projectId: String
  public var name: String
  public var type: String
  public var uniqueId: String?
  public var translation: Bool?
  public var push: Bool?
  public var mutes: Bool?
  public var linkUrl: String?
  public var imageUrl: String?
  public var customField: String?
  public var members: [String?]?

  public init(id: String? = nil, projectId: String, name: String, type: String, uniqueId: String? = nil, translation: Bool? = nil, push: Bool? = nil, mutes: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, customField: String? = nil, members: [String?]? = nil) {
    self.id = id
    self.projectId = projectId
    self.name = name
    self.type = type
    self.uniqueId = uniqueId
    self.translation = translation
    self.push = push
    self.mutes = mutes
    self.linkUrl = linkUrl
    self.imageUrl = imageUrl
    self.customField = customField
    self.members = members
  }

  public var variables: GraphQLMap? {
    return ["id": id, "projectId": projectId, "name": name, "type": type, "uniqueId": uniqueId, "translation": translation, "push": push, "mutes": mutes, "linkUrl": linkUrl, "imageUrl": imageUrl, "customField": customField, "members": members]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createChannel", arguments: ["input": ["id": GraphQLVariable("id"), "projectId": GraphQLVariable("projectId"), "name": GraphQLVariable("name"), "type": GraphQLVariable("type"), "uniqueId": GraphQLVariable("uniqueId"), "translation": GraphQLVariable("translation"), "push": GraphQLVariable("push"), "mutes": GraphQLVariable("mutes"), "customField": GraphQLVariable("customField"), "linkUrl": GraphQLVariable("linkUrl"), "imageUrl": GraphQLVariable("imageUrl"), "members": GraphQLVariable("members")]], type: .object(CreateChannel.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createChannel: CreateChannel? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createChannel": createChannel.flatMap { (value: CreateChannel) -> ResultMap in value.resultMap }])
    }

    /// Create a channel.
    public var createChannel: CreateChannel? {
      get {
        return (resultMap["createChannel"] as? ResultMap).flatMap { CreateChannel(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createChannel")
      }
    }

    public struct CreateChannel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createChannelPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .object(Channel.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channel: Channel? = nil) {
        self.init(unsafeResultMap: ["__typename": "createChannelPayload", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("unique_id", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("translation", type: .scalar(Bool.self)),
            GraphQLField("members", type: .list(.scalar(String.self))),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("link_url", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("last_message", type: .object(LastMessage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, lastMessage: LastMessage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt, "last_message": lastMessage.flatMap { (value: LastMessage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var uniqueId: String? {
          get {
            return resultMap["unique_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unique_id")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var translation: Bool? {
          get {
            return resultMap["translation"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "translation")
          }
        }

        public var members: [String?]? {
          get {
            return resultMap["members"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "members")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var linkUrl: String? {
          get {
            return resultMap["link_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_url")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var lastMessage: LastMessage? {
          get {
            return (resultMap["last_message"] as? ResultMap).flatMap { LastMessage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "last_message")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("device_type", type: .list(.scalar(String.self))),
              GraphQLField("language", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          /// 디바이스타입 [gcm,apns]
          public var deviceType: [String?]? {
            get {
              return resultMap["device_type"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "device_type")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }

        public struct LastMessage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Messages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(messageId: String, sortId: String, projectId: String, channelId: String, messageType: String? = nil, mentions: [String?]? = nil, mentionsEveryone: String? = nil, has: String? = nil, sender: Sender? = nil, admin: Admin? = nil, content: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Messages", "message_id": messageId, "sort_id": sortId, "project_id": projectId, "channel_id": channelId, "message_type": messageType, "mentions": mentions, "mentions_everyone": mentionsEveryone, "has": has, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "content": content, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var messageId: String {
            get {
              return resultMap["message_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String {
            get {
              return resultMap["sort_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var projectId: String {
            get {
              return resultMap["project_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }
        }
      }
    }
  }
}

public final class UpdateChannelMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updateChannel($projectId: String!, $name: String, $type: String, $uniqueId: String, $translation: Boolean, $push: Boolean, $linkUrl: String, $imageUrl: String, $customField: String, $id: ID!, $members: [String]) {
      updateChannel(
        input: {projectId: $projectId, name: $name, type: $type, id: $id, members: $members, uniqueId: $uniqueId, translation: $translation, push: $push, customField: $customField, linkUrl: $linkUrl, imageUrl: $imageUrl}
      ) {
        __typename
        channel {
          __typename
          id
          project_id
          name
          user_id
          user {
            __typename
            id
            name
            profile
            device_type
            language
          }
          unique_id
          type
          translation
          members
          push
          link_url
          image_url
          created_at
          updated_at
          last_message {
            __typename
            message_id
            sort_id
            project_id
            channel_id
            message_type
            mentions
            mentions_everyone
            has
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            content
            created_at
          }
        }
      }
    }
    """

  public let operationName: String = "updateChannel"

  public var projectId: String
  public var name: String?
  public var type: String?
  public var uniqueId: String?
  public var translation: Bool?
  public var push: Bool?
  public var linkUrl: String?
  public var imageUrl: String?
  public var customField: String?
  public var id: GraphQLID
  public var members: [String?]?

  public init(projectId: String, name: String? = nil, type: String? = nil, uniqueId: String? = nil, translation: Bool? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, customField: String? = nil, id: GraphQLID, members: [String?]? = nil) {
    self.projectId = projectId
    self.name = name
    self.type = type
    self.uniqueId = uniqueId
    self.translation = translation
    self.push = push
    self.linkUrl = linkUrl
    self.imageUrl = imageUrl
    self.customField = customField
    self.id = id
    self.members = members
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "name": name, "type": type, "uniqueId": uniqueId, "translation": translation, "push": push, "linkUrl": linkUrl, "imageUrl": imageUrl, "customField": customField, "id": id, "members": members]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateChannel", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "name": GraphQLVariable("name"), "type": GraphQLVariable("type"), "id": GraphQLVariable("id"), "members": GraphQLVariable("members"), "uniqueId": GraphQLVariable("uniqueId"), "translation": GraphQLVariable("translation"), "push": GraphQLVariable("push"), "customField": GraphQLVariable("customField"), "linkUrl": GraphQLVariable("linkUrl"), "imageUrl": GraphQLVariable("imageUrl")]], type: .object(UpdateChannel.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateChannel: UpdateChannel? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateChannel": updateChannel.flatMap { (value: UpdateChannel) -> ResultMap in value.resultMap }])
    }

    /// Update a channel.
    public var updateChannel: UpdateChannel? {
      get {
        return (resultMap["updateChannel"] as? ResultMap).flatMap { UpdateChannel(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateChannel")
      }
    }

    public struct UpdateChannel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["updateChannelPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .object(Channel.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channel: Channel? = nil) {
        self.init(unsafeResultMap: ["__typename": "updateChannelPayload", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("unique_id", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("translation", type: .scalar(Bool.self)),
            GraphQLField("members", type: .list(.scalar(String.self))),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("link_url", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("last_message", type: .object(LastMessage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, lastMessage: LastMessage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt, "last_message": lastMessage.flatMap { (value: LastMessage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var uniqueId: String? {
          get {
            return resultMap["unique_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unique_id")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var translation: Bool? {
          get {
            return resultMap["translation"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "translation")
          }
        }

        public var members: [String?]? {
          get {
            return resultMap["members"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "members")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var linkUrl: String? {
          get {
            return resultMap["link_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_url")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var lastMessage: LastMessage? {
          get {
            return (resultMap["last_message"] as? ResultMap).flatMap { LastMessage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "last_message")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("device_type", type: .list(.scalar(String.self))),
              GraphQLField("language", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          /// 디바이스타입 [gcm,apns]
          public var deviceType: [String?]? {
            get {
              return resultMap["device_type"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "device_type")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }

        public struct LastMessage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Messages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(messageId: String, sortId: String, projectId: String, channelId: String, messageType: String? = nil, mentions: [String?]? = nil, mentionsEveryone: String? = nil, has: String? = nil, sender: Sender? = nil, admin: Admin? = nil, content: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Messages", "message_id": messageId, "sort_id": sortId, "project_id": projectId, "channel_id": channelId, "message_type": messageType, "mentions": mentions, "mentions_everyone": mentionsEveryone, "has": has, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "content": content, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var messageId: String {
            get {
              return resultMap["message_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String {
            get {
              return resultMap["sort_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var projectId: String {
            get {
              return resultMap["project_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }
        }
      }
    }
  }
}

public final class DeleteChannelMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteChannel($projectId: String!, $id: ID!) {
      deleteChannel(input: {projectId: $projectId, id: $id}) {
        __typename
        channel {
          __typename
          id
          project_id
          name
          user_id
          user {
            __typename
            id
            name
            profile
            device_type
            language
          }
          unique_id
          type
          translation
          members
          push
          link_url
          image_url
          created_at
          updated_at
          last_message {
            __typename
            message_id
            sort_id
            project_id
            channel_id
            message_type
            mentions
            mentions_everyone
            has
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            content
            created_at
          }
        }
      }
    }
    """

  public let operationName: String = "deleteChannel"

  public var projectId: String
  public var id: GraphQLID

  public init(projectId: String, id: GraphQLID) {
    self.projectId = projectId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteChannel", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "id": GraphQLVariable("id")]], type: .object(DeleteChannel.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteChannel: DeleteChannel? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteChannel": deleteChannel.flatMap { (value: DeleteChannel) -> ResultMap in value.resultMap }])
    }

    /// Delete a channel.
    public var deleteChannel: DeleteChannel? {
      get {
        return (resultMap["deleteChannel"] as? ResultMap).flatMap { DeleteChannel(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteChannel")
      }
    }

    public struct DeleteChannel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["deleteChannelPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .object(Channel.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channel: Channel? = nil) {
        self.init(unsafeResultMap: ["__typename": "deleteChannelPayload", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("unique_id", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("translation", type: .scalar(Bool.self)),
            GraphQLField("members", type: .list(.scalar(String.self))),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("link_url", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("last_message", type: .object(LastMessage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, lastMessage: LastMessage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt, "last_message": lastMessage.flatMap { (value: LastMessage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var uniqueId: String? {
          get {
            return resultMap["unique_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unique_id")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var translation: Bool? {
          get {
            return resultMap["translation"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "translation")
          }
        }

        public var members: [String?]? {
          get {
            return resultMap["members"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "members")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var linkUrl: String? {
          get {
            return resultMap["link_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_url")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var lastMessage: LastMessage? {
          get {
            return (resultMap["last_message"] as? ResultMap).flatMap { LastMessage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "last_message")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("device_type", type: .list(.scalar(String.self))),
              GraphQLField("language", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          /// 디바이스타입 [gcm,apns]
          public var deviceType: [String?]? {
            get {
              return resultMap["device_type"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "device_type")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }

        public struct LastMessage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Messages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(messageId: String, sortId: String, projectId: String, channelId: String, messageType: String? = nil, mentions: [String?]? = nil, mentionsEveryone: String? = nil, has: String? = nil, sender: Sender? = nil, admin: Admin? = nil, content: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Messages", "message_id": messageId, "sort_id": sortId, "project_id": projectId, "channel_id": channelId, "message_type": messageType, "mentions": mentions, "mentions_everyone": mentionsEveryone, "has": has, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "content": content, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var messageId: String {
            get {
              return resultMap["message_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String {
            get {
              return resultMap["sort_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var projectId: String {
            get {
              return resultMap["project_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }
        }
      }
    }
  }
}

public final class AddChannelMembersMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addChannelMembers($projectId: String!, $channelId: String!, $memberIds: [String]!) {
      addChannelMembers(
        input: {projectId: $projectId, channelId: $channelId, memberIds: $memberIds}
      ) {
        __typename
        channel {
          __typename
          id
          project_id
          name
          user_id
          user {
            __typename
            id
            name
            profile
            device_type
            language
          }
          unique_id
          type
          translation
          members
          push
          link_url
          image_url
          created_at
          updated_at
        }
      }
    }
    """

  public let operationName: String = "addChannelMembers"

  public var projectId: String
  public var channelId: String
  public var memberIds: [String?]

  public init(projectId: String, channelId: String, memberIds: [String?]) {
    self.projectId = projectId
    self.channelId = channelId
    self.memberIds = memberIds
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "memberIds": memberIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addChannelMembers", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "memberIds": GraphQLVariable("memberIds")]], type: .object(AddChannelMember.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addChannelMembers: AddChannelMember? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addChannelMembers": addChannelMembers.flatMap { (value: AddChannelMember) -> ResultMap in value.resultMap }])
    }

    public var addChannelMembers: AddChannelMember? {
      get {
        return (resultMap["addChannelMembers"] as? ResultMap).flatMap { AddChannelMember(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addChannelMembers")
      }
    }

    public struct AddChannelMember: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["addChannelMembersPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .object(Channel.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channel: Channel? = nil) {
        self.init(unsafeResultMap: ["__typename": "addChannelMembersPayload", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("unique_id", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("translation", type: .scalar(Bool.self)),
            GraphQLField("members", type: .list(.scalar(String.self))),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("link_url", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var uniqueId: String? {
          get {
            return resultMap["unique_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unique_id")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var translation: Bool? {
          get {
            return resultMap["translation"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "translation")
          }
        }

        public var members: [String?]? {
          get {
            return resultMap["members"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "members")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var linkUrl: String? {
          get {
            return resultMap["link_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_url")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("device_type", type: .list(.scalar(String.self))),
              GraphQLField("language", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          /// 디바이스타입 [gcm,apns]
          public var deviceType: [String?]? {
            get {
              return resultMap["device_type"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "device_type")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }
      }
    }
  }
}

public final class RemoveChannelMembersMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation removeChannelMembers($projectId: String!, $channelId: String!, $memberIds: [String]!) {
      removeChannelMembers(
        input: {projectId: $projectId, channelId: $channelId, memberIds: $memberIds}
      ) {
        __typename
        channel {
          __typename
          id
          project_id
          name
          user_id
          user {
            __typename
            id
            name
            profile
            device_type
            language
          }
          unique_id
          type
          translation
          members
          push
          link_url
          image_url
          created_at
          updated_at
        }
      }
    }
    """

  public let operationName: String = "removeChannelMembers"

  public var projectId: String
  public var channelId: String
  public var memberIds: [String?]

  public init(projectId: String, channelId: String, memberIds: [String?]) {
    self.projectId = projectId
    self.channelId = channelId
    self.memberIds = memberIds
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "memberIds": memberIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeChannelMembers", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "memberIds": GraphQLVariable("memberIds")]], type: .object(RemoveChannelMember.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeChannelMembers: RemoveChannelMember? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeChannelMembers": removeChannelMembers.flatMap { (value: RemoveChannelMember) -> ResultMap in value.resultMap }])
    }

    public var removeChannelMembers: RemoveChannelMember? {
      get {
        return (resultMap["removeChannelMembers"] as? ResultMap).flatMap { RemoveChannelMember(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeChannelMembers")
      }
    }

    public struct RemoveChannelMember: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["removeChannelMembersPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .object(Channel.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channel: Channel? = nil) {
        self.init(unsafeResultMap: ["__typename": "removeChannelMembersPayload", "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("unique_id", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("translation", type: .scalar(Bool.self)),
            GraphQLField("members", type: .list(.scalar(String.self))),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("link_url", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String? = nil, name: String? = nil, userId: String? = nil, user: User? = nil, uniqueId: String? = nil, type: String? = nil, translation: Bool? = nil, members: [String?]? = nil, push: Bool? = nil, linkUrl: String? = nil, imageUrl: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "id": id, "project_id": projectId, "name": name, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "unique_id": uniqueId, "type": type, "translation": translation, "members": members, "push": push, "link_url": linkUrl, "image_url": imageUrl, "created_at": createdAt, "updated_at": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var uniqueId: String? {
          get {
            return resultMap["unique_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unique_id")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var translation: Bool? {
          get {
            return resultMap["translation"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "translation")
          }
        }

        public var members: [String?]? {
          get {
            return resultMap["members"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "members")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var linkUrl: String? {
          get {
            return resultMap["link_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_url")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("device_type", type: .list(.scalar(String.self))),
              GraphQLField("language", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, deviceType: [String?]? = nil, language: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "device_type": deviceType, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          /// 디바이스타입 [gcm,apns]
          public var deviceType: [String?]? {
            get {
              return resultMap["device_type"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "device_type")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }
      }
    }
  }
}

public final class FriendshipsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query friendships($projectId: String!, $filter: String!, $sort: String, $option: String) {
      friendships(
        projectId: $projectId
        filter: $filter
        sort: $sort
        option: $option
      ) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            project_id
            id
            status
            user {
              __typename
              id
              name
              profile
            }
            friend {
              __typename
              id
              name
              profile
            }
            friend_id
            created_at
            updated_at
            requested_at
          }
        }
      }
    }
    """

  public let operationName: String = "friendships"

  public var projectId: String
  public var filter: String
  public var sort: String?
  public var option: String?

  public init(projectId: String, filter: String, sort: String? = nil, option: String? = nil) {
    self.projectId = projectId
    self.filter = filter
    self.sort = sort
    self.option = option
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "filter": filter, "sort": sort, "option": option]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("friendships", arguments: ["projectId": GraphQLVariable("projectId"), "filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort"), "option": GraphQLVariable("option")], type: .object(Friendship.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(friendships: Friendship? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "friendships": friendships.flatMap { (value: Friendship) -> ResultMap in value.resultMap }])
    }

    public var friendships: Friendship? {
      get {
        return (resultMap["friendships"] as? ResultMap).flatMap { Friendship(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "friendships")
      }
    }

    public struct Friendship: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FriendShipsConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FriendShipsConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendShipsEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "FriendShipsEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FriendShipType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("project_id", type: .scalar(String.self)),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("status", type: .scalar(String.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("friend", type: .object(Friend.selections)),
              GraphQLField("friend_id", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
              GraphQLField("updated_at", type: .scalar(String.self)),
              GraphQLField("requested_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(projectId: String? = nil, id: String? = nil, status: String? = nil, user: User? = nil, friend: Friend? = nil, friendId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, requestedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "FriendShipType", "project_id": projectId, "id": id, "status": status, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "friend": friend.flatMap { (value: Friend) -> ResultMap in value.resultMap }, "friend_id": friendId, "created_at": createdAt, "updated_at": updatedAt, "requested_at": requestedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var projectId: String? {
            get {
              return resultMap["project_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var status: String? {
            get {
              return resultMap["status"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var friend: Friend? {
            get {
              return (resultMap["friend"] as? ResultMap).flatMap { Friend(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "friend")
            }
          }

          public var friendId: String? {
            get {
              return resultMap["friend_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "friend_id")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public var updatedAt: String? {
            get {
              return resultMap["updated_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updated_at")
            }
          }

          public var requestedAt: String? {
            get {
              return resultMap["requested_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "requested_at")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Members"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Friend: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Members"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }
        }
      }
    }
  }
}

public final class RequestFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation requestFriend($projectId: String!, $friendId: String!) {
      requestFriend(input: {projectId: $projectId, friendId: $friendId}) {
        __typename
        friendship {
          __typename
          project_id
          id
          status
          user {
            __typename
            id
            name
            profile
          }
          friend {
            __typename
            id
            name
            profile
          }
          friend_id
          created_at
          updated_at
          requested_at
        }
      }
    }
    """

  public let operationName: String = "requestFriend"

  public var projectId: String
  public var friendId: String

  public init(projectId: String, friendId: String) {
    self.projectId = projectId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("requestFriend", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "friendId": GraphQLVariable("friendId")]], type: .object(RequestFriend.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestFriend: RequestFriend? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "requestFriend": requestFriend.flatMap { (value: RequestFriend) -> ResultMap in value.resultMap }])
    }

    public var requestFriend: RequestFriend? {
      get {
        return (resultMap["requestFriend"] as? ResultMap).flatMap { RequestFriend(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "requestFriend")
      }
    }

    public struct RequestFriend: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["requestFriendPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friendship", type: .object(Friendship.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friendship: Friendship? = nil) {
        self.init(unsafeResultMap: ["__typename": "requestFriendPayload", "friendship": friendship.flatMap { (value: Friendship) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friendship: Friendship? {
        get {
          return (resultMap["friendship"] as? ResultMap).flatMap { Friendship(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "friendship")
        }
      }

      public struct Friendship: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendShipType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("friend", type: .object(Friend.selections)),
            GraphQLField("friend_id", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("requested_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(projectId: String? = nil, id: String? = nil, status: String? = nil, user: User? = nil, friend: Friend? = nil, friendId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, requestedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FriendShipType", "project_id": projectId, "id": id, "status": status, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "friend": friend.flatMap { (value: Friend) -> ResultMap in value.resultMap }, "friend_id": friendId, "created_at": createdAt, "updated_at": updatedAt, "requested_at": requestedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var friend: Friend? {
          get {
            return (resultMap["friend"] as? ResultMap).flatMap { Friend(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "friend")
          }
        }

        public var friendId: String? {
          get {
            return resultMap["friend_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "friend_id")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var requestedAt: String? {
          get {
            return resultMap["requested_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "requested_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class AcceptFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation acceptFriend($projectId: String!, $friendId: String!) {
      acceptFriend(input: {projectId: $projectId, friendId: $friendId}) {
        __typename
        friendship {
          __typename
          project_id
          id
          status
          user {
            __typename
            id
            name
            profile
          }
          friend {
            __typename
            id
            name
            profile
          }
          friend_id
          created_at
          updated_at
          requested_at
        }
      }
    }
    """

  public let operationName: String = "acceptFriend"

  public var projectId: String
  public var friendId: String

  public init(projectId: String, friendId: String) {
    self.projectId = projectId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptFriend", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "friendId": GraphQLVariable("friendId")]], type: .object(AcceptFriend.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptFriend: AcceptFriend? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "acceptFriend": acceptFriend.flatMap { (value: AcceptFriend) -> ResultMap in value.resultMap }])
    }

    public var acceptFriend: AcceptFriend? {
      get {
        return (resultMap["acceptFriend"] as? ResultMap).flatMap { AcceptFriend(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "acceptFriend")
      }
    }

    public struct AcceptFriend: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["acceptFriendPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friendship", type: .object(Friendship.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friendship: Friendship? = nil) {
        self.init(unsafeResultMap: ["__typename": "acceptFriendPayload", "friendship": friendship.flatMap { (value: Friendship) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friendship: Friendship? {
        get {
          return (resultMap["friendship"] as? ResultMap).flatMap { Friendship(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "friendship")
        }
      }

      public struct Friendship: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendShipType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("friend", type: .object(Friend.selections)),
            GraphQLField("friend_id", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("requested_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(projectId: String? = nil, id: String? = nil, status: String? = nil, user: User? = nil, friend: Friend? = nil, friendId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, requestedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FriendShipType", "project_id": projectId, "id": id, "status": status, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "friend": friend.flatMap { (value: Friend) -> ResultMap in value.resultMap }, "friend_id": friendId, "created_at": createdAt, "updated_at": updatedAt, "requested_at": requestedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var friend: Friend? {
          get {
            return (resultMap["friend"] as? ResultMap).flatMap { Friend(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "friend")
          }
        }

        public var friendId: String? {
          get {
            return resultMap["friend_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "friend_id")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var requestedAt: String? {
          get {
            return resultMap["requested_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "requested_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class RejectFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation rejectFriend($projectId: String!, $friendId: String!) {
      rejectFriend(input: {projectId: $projectId, friendId: $friendId}) {
        __typename
        friendship {
          __typename
          project_id
          id
          status
          user {
            __typename
            id
            name
            profile
          }
          friend {
            __typename
            id
            name
            profile
          }
          friend_id
          created_at
          updated_at
          requested_at
        }
      }
    }
    """

  public let operationName: String = "rejectFriend"

  public var projectId: String
  public var friendId: String

  public init(projectId: String, friendId: String) {
    self.projectId = projectId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rejectFriend", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "friendId": GraphQLVariable("friendId")]], type: .object(RejectFriend.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rejectFriend: RejectFriend? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "rejectFriend": rejectFriend.flatMap { (value: RejectFriend) -> ResultMap in value.resultMap }])
    }

    public var rejectFriend: RejectFriend? {
      get {
        return (resultMap["rejectFriend"] as? ResultMap).flatMap { RejectFriend(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rejectFriend")
      }
    }

    public struct RejectFriend: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["rejectFriendPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friendship", type: .object(Friendship.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friendship: Friendship? = nil) {
        self.init(unsafeResultMap: ["__typename": "rejectFriendPayload", "friendship": friendship.flatMap { (value: Friendship) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friendship: Friendship? {
        get {
          return (resultMap["friendship"] as? ResultMap).flatMap { Friendship(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "friendship")
        }
      }

      public struct Friendship: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendShipType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("friend", type: .object(Friend.selections)),
            GraphQLField("friend_id", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("requested_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(projectId: String? = nil, id: String? = nil, status: String? = nil, user: User? = nil, friend: Friend? = nil, friendId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, requestedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FriendShipType", "project_id": projectId, "id": id, "status": status, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "friend": friend.flatMap { (value: Friend) -> ResultMap in value.resultMap }, "friend_id": friendId, "created_at": createdAt, "updated_at": updatedAt, "requested_at": requestedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var friend: Friend? {
          get {
            return (resultMap["friend"] as? ResultMap).flatMap { Friend(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "friend")
          }
        }

        public var friendId: String? {
          get {
            return resultMap["friend_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "friend_id")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var requestedAt: String? {
          get {
            return resultMap["requested_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "requested_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class RemoveFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation removeFriend($projectId: String!, $friendId: String!) {
      removeFriend(input: {projectId: $projectId, friendId: $friendId}) {
        __typename
        friendship {
          __typename
          project_id
          id
          status
          user {
            __typename
            id
            name
            profile
          }
          friend {
            __typename
            id
            name
            profile
          }
          friend_id
          created_at
          updated_at
          requested_at
        }
      }
    }
    """

  public let operationName: String = "removeFriend"

  public var projectId: String
  public var friendId: String

  public init(projectId: String, friendId: String) {
    self.projectId = projectId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeFriend", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "friendId": GraphQLVariable("friendId")]], type: .object(RemoveFriend.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFriend: RemoveFriend? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeFriend": removeFriend.flatMap { (value: RemoveFriend) -> ResultMap in value.resultMap }])
    }

    public var removeFriend: RemoveFriend? {
      get {
        return (resultMap["removeFriend"] as? ResultMap).flatMap { RemoveFriend(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeFriend")
      }
    }

    public struct RemoveFriend: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["removeFriendPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friendship", type: .object(Friendship.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friendship: Friendship? = nil) {
        self.init(unsafeResultMap: ["__typename": "removeFriendPayload", "friendship": friendship.flatMap { (value: Friendship) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friendship: Friendship? {
        get {
          return (resultMap["friendship"] as? ResultMap).flatMap { Friendship(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "friendship")
        }
      }

      public struct Friendship: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendShipType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("project_id", type: .scalar(String.self)),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("friend", type: .object(Friend.selections)),
            GraphQLField("friend_id", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("requested_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(projectId: String? = nil, id: String? = nil, status: String? = nil, user: User? = nil, friend: Friend? = nil, friendId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, requestedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FriendShipType", "project_id": projectId, "id": id, "status": status, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "friend": friend.flatMap { (value: Friend) -> ResultMap in value.resultMap }, "friend_id": friendId, "created_at": createdAt, "updated_at": updatedAt, "requested_at": requestedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var projectId: String? {
          get {
            return resultMap["project_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var friend: Friend? {
          get {
            return (resultMap["friend"] as? ResultMap).flatMap { Friend(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "friend")
          }
        }

        public var friendId: String? {
          get {
            return resultMap["friend_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "friend_id")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var requestedAt: String? {
          get {
            return resultMap["requested_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "requested_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($projectId: String!, $userId: String!, $name: String, $profile: String, $customField: String) {
      login(
        input: {projectId: $projectId, userId: $userId, name: $name, profile: $profile, customField: $customField}
      ) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "login"

  public var projectId: String
  public var userId: String
  public var name: String?
  public var profile: String?
  public var customField: String?

  public init(projectId: String, userId: String, name: String? = nil, profile: String? = nil, customField: String? = nil) {
    self.projectId = projectId
    self.userId = userId
    self.name = name
    self.profile = profile
    self.customField = customField
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "userId": userId, "name": name, "profile": profile, "customField": customField]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "userId": GraphQLVariable("userId"), "name": GraphQLVariable("name"), "profile": GraphQLVariable("profile"), "customField": GraphQLVariable("customField")]], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    /// Login
    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["loginPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "loginPayload", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class CreateMemberBlockMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createMemberBlock($projectId: String!, $memberId: String!, $channelId: String, $options: String) {
      createMemberBlock(
        input: {projectId: $projectId, memberId: $memberId, channelId: $channelId, options: $options}
      ) {
        __typename
        memberBlock {
          __typename
          id
          project_id
          member_id
          type
          status
          block_type
          reason
          messageMulti {
            __typename
            lang
            value
            default
          }
          started_at
          ended_at
          created_at
          updated_at
          deleted_at
        }
      }
    }
    """

  public let operationName: String = "createMemberBlock"

  public var projectId: String
  public var memberId: String
  public var channelId: String?
  public var options: String?

  public init(projectId: String, memberId: String, channelId: String? = nil, options: String? = nil) {
    self.projectId = projectId
    self.memberId = memberId
    self.channelId = channelId
    self.options = options
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "memberId": memberId, "channelId": channelId, "options": options]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createMemberBlock", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "memberId": GraphQLVariable("memberId"), "channelId": GraphQLVariable("channelId"), "options": GraphQLVariable("options")]], type: .object(CreateMemberBlock.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMemberBlock: CreateMemberBlock? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMemberBlock": createMemberBlock.flatMap { (value: CreateMemberBlock) -> ResultMap in value.resultMap }])
    }

    /// Create a MemberBlock.
    public var createMemberBlock: CreateMemberBlock? {
      get {
        return (resultMap["createMemberBlock"] as? ResultMap).flatMap { CreateMemberBlock(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createMemberBlock")
      }
    }

    public struct CreateMemberBlock: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createMemberBlockPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("memberBlock", type: .object(MemberBlock.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(memberBlock: MemberBlock? = nil) {
        self.init(unsafeResultMap: ["__typename": "createMemberBlockPayload", "memberBlock": memberBlock.flatMap { (value: MemberBlock) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var memberBlock: MemberBlock? {
        get {
          return (resultMap["memberBlock"] as? ResultMap).flatMap { MemberBlock(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "memberBlock")
        }
      }

      public struct MemberBlock: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MemberBlock"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("member_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("block_type", type: .scalar(Int.self)),
            GraphQLField("reason", type: .scalar(String.self)),
            GraphQLField("messageMulti", type: .list(.object(MessageMulti.selections))),
            GraphQLField("started_at", type: .scalar(String.self)),
            GraphQLField("ended_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("deleted_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String, memberId: String, type: String? = nil, status: Int? = nil, blockType: Int? = nil, reason: String? = nil, messageMulti: [MessageMulti?]? = nil, startedAt: String? = nil, endedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, deletedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MemberBlock", "id": id, "project_id": projectId, "member_id": memberId, "type": type, "status": status, "block_type": blockType, "reason": reason, "messageMulti": messageMulti.flatMap { (value: [MessageMulti?]) -> [ResultMap?] in value.map { (value: MessageMulti?) -> ResultMap? in value.flatMap { (value: MessageMulti) -> ResultMap in value.resultMap } } }, "started_at": startedAt, "ended_at": endedAt, "created_at": createdAt, "updated_at": updatedAt, "deleted_at": deletedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// 프로젝트 아이디
        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        /// 멤버 아이디
        public var memberId: String {
          get {
            return resultMap["member_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "member_id")
          }
        }

        /// 종류('auto' or 'manual')
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// 사용여부 (0:비활성, 1:활성)
        public var status: Int? {
          get {
            return resultMap["status"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// 정지타입(1:일시정지), 영구정지는 종료일이 2099-12-31 23:59:59 일 경우
        public var blockType: Int? {
          get {
            return resultMap["block_type"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "block_type")
          }
        }

        /// 차단 사유
        public var reason: String? {
          get {
            return resultMap["reason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "reason")
          }
        }

        public var messageMulti: [MessageMulti?]? {
          get {
            return (resultMap["messageMulti"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MessageMulti?] in value.map { (value: ResultMap?) -> MessageMulti? in value.flatMap { (value: ResultMap) -> MessageMulti in MessageMulti(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [MessageMulti?]) -> [ResultMap?] in value.map { (value: MessageMulti?) -> ResultMap? in value.flatMap { (value: MessageMulti) -> ResultMap in value.resultMap } } }, forKey: "messageMulti")
          }
        }

        public var startedAt: String? {
          get {
            return resultMap["started_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "started_at")
          }
        }

        public var endedAt: String? {
          get {
            return resultMap["ended_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ended_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var deletedAt: String? {
          get {
            return resultMap["deleted_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "deleted_at")
          }
        }

        public struct MessageMulti: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Language"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("lang", type: .scalar(String.self)),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("default", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lang: String? = nil, value: String? = nil, `default`: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Language", "lang": lang, "value": value, "default": `default`])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lang: String? {
            get {
              return resultMap["lang"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lang")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var `default`: Bool? {
            get {
              return resultMap["default"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "default")
            }
          }
        }
      }
    }
  }
}

public final class DeleteMemberBlockMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteMemberBlock($projectId: String!, $memberId: String!, $channelId: String) {
      deleteMemberBlock(
        input: {projectId: $projectId, memberId: $memberId, channelId: $channelId}
      ) {
        __typename
        memberBlock {
          __typename
          id
          project_id
          member_id
          type
          status
          block_type
          reason
          messageMulti {
            __typename
            lang
            value
            default
          }
          started_at
          ended_at
          created_at
          updated_at
          deleted_at
        }
      }
    }
    """

  public let operationName: String = "deleteMemberBlock"

  public var projectId: String
  public var memberId: String
  public var channelId: String?

  public init(projectId: String, memberId: String, channelId: String? = nil) {
    self.projectId = projectId
    self.memberId = memberId
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "memberId": memberId, "channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteMemberBlock", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "memberId": GraphQLVariable("memberId"), "channelId": GraphQLVariable("channelId")]], type: .object(DeleteMemberBlock.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMemberBlock: DeleteMemberBlock? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMemberBlock": deleteMemberBlock.flatMap { (value: DeleteMemberBlock) -> ResultMap in value.resultMap }])
    }

    public var deleteMemberBlock: DeleteMemberBlock? {
      get {
        return (resultMap["deleteMemberBlock"] as? ResultMap).flatMap { DeleteMemberBlock(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteMemberBlock")
      }
    }

    public struct DeleteMemberBlock: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["deleteMemberBlockPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("memberBlock", type: .object(MemberBlock.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(memberBlock: MemberBlock? = nil) {
        self.init(unsafeResultMap: ["__typename": "deleteMemberBlockPayload", "memberBlock": memberBlock.flatMap { (value: MemberBlock) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var memberBlock: MemberBlock? {
        get {
          return (resultMap["memberBlock"] as? ResultMap).flatMap { MemberBlock(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "memberBlock")
        }
      }

      public struct MemberBlock: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MemberBlock"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("member_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("block_type", type: .scalar(Int.self)),
            GraphQLField("reason", type: .scalar(String.self)),
            GraphQLField("messageMulti", type: .list(.object(MessageMulti.selections))),
            GraphQLField("started_at", type: .scalar(String.self)),
            GraphQLField("ended_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("deleted_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String, memberId: String, type: String? = nil, status: Int? = nil, blockType: Int? = nil, reason: String? = nil, messageMulti: [MessageMulti?]? = nil, startedAt: String? = nil, endedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, deletedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MemberBlock", "id": id, "project_id": projectId, "member_id": memberId, "type": type, "status": status, "block_type": blockType, "reason": reason, "messageMulti": messageMulti.flatMap { (value: [MessageMulti?]) -> [ResultMap?] in value.map { (value: MessageMulti?) -> ResultMap? in value.flatMap { (value: MessageMulti) -> ResultMap in value.resultMap } } }, "started_at": startedAt, "ended_at": endedAt, "created_at": createdAt, "updated_at": updatedAt, "deleted_at": deletedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// 프로젝트 아이디
        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        /// 멤버 아이디
        public var memberId: String {
          get {
            return resultMap["member_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "member_id")
          }
        }

        /// 종류('auto' or 'manual')
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// 사용여부 (0:비활성, 1:활성)
        public var status: Int? {
          get {
            return resultMap["status"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// 정지타입(1:일시정지), 영구정지는 종료일이 2099-12-31 23:59:59 일 경우
        public var blockType: Int? {
          get {
            return resultMap["block_type"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "block_type")
          }
        }

        /// 차단 사유
        public var reason: String? {
          get {
            return resultMap["reason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "reason")
          }
        }

        public var messageMulti: [MessageMulti?]? {
          get {
            return (resultMap["messageMulti"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MessageMulti?] in value.map { (value: ResultMap?) -> MessageMulti? in value.flatMap { (value: ResultMap) -> MessageMulti in MessageMulti(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [MessageMulti?]) -> [ResultMap?] in value.map { (value: MessageMulti?) -> ResultMap? in value.flatMap { (value: MessageMulti) -> ResultMap in value.resultMap } } }, forKey: "messageMulti")
          }
        }

        public var startedAt: String? {
          get {
            return resultMap["started_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "started_at")
          }
        }

        public var endedAt: String? {
          get {
            return resultMap["ended_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ended_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var deletedAt: String? {
          get {
            return resultMap["deleted_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "deleted_at")
          }
        }

        public struct MessageMulti: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Language"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("lang", type: .scalar(String.self)),
              GraphQLField("value", type: .scalar(String.self)),
              GraphQLField("default", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lang: String? = nil, value: String? = nil, `default`: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Language", "lang": lang, "value": value, "default": `default`])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lang: String? {
            get {
              return resultMap["lang"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lang")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var `default`: Bool? {
            get {
              return resultMap["default"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "default")
            }
          }
        }
      }
    }
  }
}

public final class MembersForQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query membersForQuery($projectId: String!, $option: String!, $filter: String!, $sort: String) {
      membersForQuery(
        projectId: $projectId
        option: $option
        filter: $filter
        sort: $sort
      ) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            id
            name
          }
        }
      }
    }
    """

  public let operationName: String = "membersForQuery"

  public var projectId: String
  public var option: String
  public var filter: String
  public var sort: String?

  public init(projectId: String, option: String, filter: String, sort: String? = nil) {
    self.projectId = projectId
    self.option = option
    self.filter = filter
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "option": option, "filter": filter, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("membersForQuery", arguments: ["projectId": GraphQLVariable("projectId"), "option": GraphQLVariable("option"), "filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort")], type: .object(MembersForQuery.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(membersForQuery: MembersForQuery? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "membersForQuery": membersForQuery.flatMap { (value: MembersForQuery) -> ResultMap in value.resultMap }])
    }

    public var membersForQuery: MembersForQuery? {
      get {
        return (resultMap["membersForQuery"] as? ResultMap).flatMap { MembersForQuery(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "membersForQuery")
      }
    }

    public struct MembersForQuery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MembersForQueryConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MembersForQueryConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MembersForQueryEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "MembersForQueryEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class UpdateMemberMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updateMember($id: String!, $projectId: String!, $name: String, $profile: String, $remoteip: String, $memo: String, $adid: String, $device: String, $deviceType: [String], $network: String, $version: String, $model: String, $notications: NoticationInput) {
      updateMember(
        input: {id: $id, projectId: $projectId, profile: $profile, memo: $memo, name: $name, remoteip: $remoteip, adid: $adid, device: $device, deviceType: $deviceType, network: $network, version: $version, model: $model, notications: $notications}
      ) {
        __typename
        member {
          __typename
          id
          project_id
          name
          profile
          country
          memo
          remoteip
          adid
          device
          network
          push
          version
          model
          logined_at
          created_at
          updated_at
          notications {
            __typename
            token
            device
            os
          }
        }
      }
    }
    """

  public let operationName: String = "updateMember"

  public var id: String
  public var projectId: String
  public var name: String?
  public var profile: String?
  public var remoteip: String?
  public var memo: String?
  public var adid: String?
  public var device: String?
  public var deviceType: [String?]?
  public var network: String?
  public var version: String?
  public var model: String?
  public var notications: NoticationInput?

  public init(id: String, projectId: String, name: String? = nil, profile: String? = nil, remoteip: String? = nil, memo: String? = nil, adid: String? = nil, device: String? = nil, deviceType: [String?]? = nil, network: String? = nil, version: String? = nil, model: String? = nil, notications: NoticationInput? = nil) {
    self.id = id
    self.projectId = projectId
    self.name = name
    self.profile = profile
    self.remoteip = remoteip
    self.memo = memo
    self.adid = adid
    self.device = device
    self.deviceType = deviceType
    self.network = network
    self.version = version
    self.model = model
    self.notications = notications
  }

  public var variables: GraphQLMap? {
    return ["id": id, "projectId": projectId, "name": name, "profile": profile, "remoteip": remoteip, "memo": memo, "adid": adid, "device": device, "deviceType": deviceType, "network": network, "version": version, "model": model, "notications": notications]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateMember", arguments: ["input": ["id": GraphQLVariable("id"), "projectId": GraphQLVariable("projectId"), "profile": GraphQLVariable("profile"), "memo": GraphQLVariable("memo"), "name": GraphQLVariable("name"), "remoteip": GraphQLVariable("remoteip"), "adid": GraphQLVariable("adid"), "device": GraphQLVariable("device"), "deviceType": GraphQLVariable("deviceType"), "network": GraphQLVariable("network"), "version": GraphQLVariable("version"), "model": GraphQLVariable("model"), "notications": GraphQLVariable("notications")]], type: .object(UpdateMember.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateMember: UpdateMember? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateMember": updateMember.flatMap { (value: UpdateMember) -> ResultMap in value.resultMap }])
    }

    public var updateMember: UpdateMember? {
      get {
        return (resultMap["updateMember"] as? ResultMap).flatMap { UpdateMember(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateMember")
      }
    }

    public struct UpdateMember: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["updateMemberPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("member", type: .object(Member.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(member: Member? = nil) {
        self.init(unsafeResultMap: ["__typename": "updateMemberPayload", "member": member.flatMap { (value: Member) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var member: Member? {
        get {
          return (resultMap["member"] as? ResultMap).flatMap { Member(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "member")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Members"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
            GraphQLField("country", type: .scalar(String.self)),
            GraphQLField("memo", type: .scalar(String.self)),
            GraphQLField("remoteip", type: .scalar(String.self)),
            GraphQLField("adid", type: .scalar(String.self)),
            GraphQLField("device", type: .scalar(String.self)),
            GraphQLField("network", type: .scalar(String.self)),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("version", type: .scalar(String.self)),
            GraphQLField("model", type: .scalar(String.self)),
            GraphQLField("logined_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
            GraphQLField("notications", type: .object(Notication.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String, name: String? = nil, profile: String? = nil, country: String? = nil, memo: String? = nil, remoteip: String? = nil, adid: String? = nil, device: String? = nil, network: String? = nil, push: Bool? = nil, version: String? = nil, model: String? = nil, loginedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, notications: Notication? = nil) {
          self.init(unsafeResultMap: ["__typename": "Members", "id": id, "project_id": projectId, "name": name, "profile": profile, "country": country, "memo": memo, "remoteip": remoteip, "adid": adid, "device": device, "network": network, "push": push, "version": version, "model": model, "logined_at": loginedAt, "created_at": createdAt, "updated_at": updatedAt, "notications": notications.flatMap { (value: Notication) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }

        public var country: String? {
          get {
            return resultMap["country"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "country")
          }
        }

        public var memo: String? {
          get {
            return resultMap["memo"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "memo")
          }
        }

        public var remoteip: String? {
          get {
            return resultMap["remoteip"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "remoteip")
          }
        }

        public var adid: String? {
          get {
            return resultMap["adid"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "adid")
          }
        }

        /// 디바이스 정보
        public var device: String? {
          get {
            return resultMap["device"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "device")
          }
        }

        public var network: String? {
          get {
            return resultMap["network"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "network")
          }
        }

        /// 푸시알림여부
        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var version: String? {
          get {
            return resultMap["version"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "version")
          }
        }

        public var model: String? {
          get {
            return resultMap["model"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "model")
          }
        }

        public var loginedAt: String? {
          get {
            return resultMap["logined_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "logined_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public var notications: Notication? {
          get {
            return (resultMap["notications"] as? ResultMap).flatMap { Notication(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "notications")
          }
        }

        public struct Notication: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Notication"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("token", type: .scalar(String.self)),
              GraphQLField("device", type: .scalar(String.self)),
              GraphQLField("os", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(token: String? = nil, device: String? = nil, os: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Notication", "token": token, "device": device, "os": os])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var token: String? {
            get {
              return resultMap["token"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "token")
            }
          }

          public var device: String? {
            get {
              return resultMap["device"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "device")
            }
          }

          public var os: String? {
            get {
              return resultMap["os"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "os")
            }
          }
        }
      }
    }
  }
}

public final class MessageQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query message($projectId: String!, $channelId: String!, $id: ID!) {
      message(projectId: $projectId, channelId: $channelId, id: $id) {
        __typename
        id
        message_id
        channel_id
        sort_id
        message_type
        sender {
          __typename
          id
          name
          profile
        }
        admin {
          __typename
          id
          name
          profile
        }
        attachment_filenames {
          __typename
          name
          size
          type
          url
        }
        has
        embed_providers
        embed_type
        parent_message_id
        parent_message {
          __typename
          id
          message_id
          channel_id
          sort_id
          message_type
          sender {
            __typename
            id
            name
            profile
          }
          admin {
            __typename
            id
            name
            profile
          }
          attachment_filenames {
            __typename
            name
            size
            type
            url
          }
          has
          embed_providers
          embed_type
          isExpress
          link_hostnames
          mentions
          bytes
          mentions_everyone
          content
          sended_at
          created_at
        }
        isExpress
        link_hostnames
        mentions
        bytes
        mentions_everyone
        content
        sended_at
        created_at
      }
    }
    """

  public let operationName: String = "message"

  public var projectId: String
  public var channelId: String
  public var id: GraphQLID

  public init(projectId: String, channelId: String, id: GraphQLID) {
    self.projectId = projectId
    self.channelId = channelId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("message", arguments: ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "id": GraphQLVariable("id")], type: .object(Message.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(message: Message? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
    }

    public var message: Message? {
      get {
        return (resultMap["message"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "message")
      }
    }

    public struct Message: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Messages"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("message_type", type: .scalar(String.self)),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("admin", type: .object(Admin.selections)),
          GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
          GraphQLField("has", type: .scalar(String.self)),
          GraphQLField("embed_providers", type: .scalar(String.self)),
          GraphQLField("embed_type", type: .scalar(String.self)),
          GraphQLField("parent_message_id", type: .scalar(String.self)),
          GraphQLField("parent_message", type: .object(ParentMessage.selections)),
          GraphQLField("isExpress", type: .scalar(Bool.self)),
          GraphQLField("link_hostnames", type: .scalar(String.self)),
          GraphQLField("mentions", type: .list(.scalar(String.self))),
          GraphQLField("bytes", type: .scalar(Int.self)),
          GraphQLField("mentions_everyone", type: .scalar(String.self)),
          GraphQLField("content", type: .scalar(String.self)),
          GraphQLField("sended_at", type: .scalar(String.self)),
          GraphQLField("created_at", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, messageId: String, channelId: String, sortId: String, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, parentMessageId: String? = nil, parentMessage: ParentMessage? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Messages", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "parent_message_id": parentMessageId, "parent_message": parentMessage.flatMap { (value: ParentMessage) -> ResultMap in value.resultMap }, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var messageId: String {
        get {
          return resultMap["message_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_id")
        }
      }

      public var channelId: String {
        get {
          return resultMap["channel_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_id")
        }
      }

      public var sortId: String {
        get {
          return resultMap["sort_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "sort_id")
        }
      }

      public var messageType: String? {
        get {
          return resultMap["message_type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_type")
        }
      }

      public var sender: Sender? {
        get {
          return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "sender")
        }
      }

      public var admin: Admin? {
        get {
          return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "admin")
        }
      }

      public var attachmentFilenames: AttachmentFilename? {
        get {
          return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
        }
      }

      public var has: String? {
        get {
          return resultMap["has"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "has")
        }
      }

      public var embedProviders: String? {
        get {
          return resultMap["embed_providers"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "embed_providers")
        }
      }

      public var embedType: String? {
        get {
          return resultMap["embed_type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "embed_type")
        }
      }

      public var parentMessageId: String? {
        get {
          return resultMap["parent_message_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "parent_message_id")
        }
      }

      public var parentMessage: ParentMessage? {
        get {
          return (resultMap["parent_message"] as? ResultMap).flatMap { ParentMessage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "parent_message")
        }
      }

      public var isExpress: Bool? {
        get {
          return resultMap["isExpress"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isExpress")
        }
      }

      public var linkHostnames: String? {
        get {
          return resultMap["link_hostnames"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "link_hostnames")
        }
      }

      public var mentions: [String?]? {
        get {
          return resultMap["mentions"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "mentions")
        }
      }

      public var bytes: Int? {
        get {
          return resultMap["bytes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "bytes")
        }
      }

      public var mentionsEveryone: String? {
        get {
          return resultMap["mentions_everyone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mentions_everyone")
        }
      }

      public var content: String? {
        get {
          return resultMap["content"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var sendedAt: String? {
        get {
          return resultMap["sended_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "sended_at")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["created_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created_at")
        }
      }

      public struct Sender: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Sender"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }
      }

      public struct Admin: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Sender"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }
      }

      public struct AttachmentFilename: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Attachment"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("size", type: .scalar(Double.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var size: Double? {
          get {
            return resultMap["size"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "size")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct ParentMessage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MessageParentType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("message_id", type: .scalar(String.self)),
            GraphQLField("channel_id", type: .scalar(String.self)),
            GraphQLField("sort_id", type: .scalar(String.self)),
            GraphQLField("message_type", type: .scalar(String.self)),
            GraphQLField("sender", type: .object(Sender.selections)),
            GraphQLField("admin", type: .object(Admin.selections)),
            GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
            GraphQLField("has", type: .scalar(String.self)),
            GraphQLField("embed_providers", type: .scalar(String.self)),
            GraphQLField("embed_type", type: .scalar(String.self)),
            GraphQLField("isExpress", type: .scalar(Bool.self)),
            GraphQLField("link_hostnames", type: .scalar(String.self)),
            GraphQLField("mentions", type: .list(.scalar(String.self))),
            GraphQLField("bytes", type: .scalar(Int.self)),
            GraphQLField("mentions_everyone", type: .scalar(String.self)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("sended_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, messageId: String? = nil, channelId: String? = nil, sortId: String? = nil, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessageParentType", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var messageId: String? {
          get {
            return resultMap["message_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var channelId: String? {
          get {
            return resultMap["channel_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var sortId: String? {
          get {
            return resultMap["sort_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sort_id")
          }
        }

        public var messageType: String? {
          get {
            return resultMap["message_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_type")
          }
        }

        public var sender: Sender? {
          get {
            return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "sender")
          }
        }

        public var admin: Admin? {
          get {
            return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "admin")
          }
        }

        public var attachmentFilenames: AttachmentFilename? {
          get {
            return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
          }
        }

        public var has: String? {
          get {
            return resultMap["has"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "has")
          }
        }

        public var embedProviders: String? {
          get {
            return resultMap["embed_providers"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_providers")
          }
        }

        public var embedType: String? {
          get {
            return resultMap["embed_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_type")
          }
        }

        public var isExpress: Bool? {
          get {
            return resultMap["isExpress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isExpress")
          }
        }

        public var linkHostnames: String? {
          get {
            return resultMap["link_hostnames"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_hostnames")
          }
        }

        public var mentions: [String?]? {
          get {
            return resultMap["mentions"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions")
          }
        }

        public var bytes: Int? {
          get {
            return resultMap["bytes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "bytes")
          }
        }

        public var mentionsEveryone: String? {
          get {
            return resultMap["mentions_everyone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions_everyone")
          }
        }

        public var content: String? {
          get {
            return resultMap["content"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var sendedAt: String? {
          get {
            return resultMap["sended_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sended_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Admin: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct AttachmentFilename: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Attachment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("size", type: .scalar(Double.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var size: Double? {
            get {
              return resultMap["size"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "size")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}

public final class MessagesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query messages($projectId: String!, $filter: String!, $option: String, $sort: String) {
      messages(projectId: $projectId, filter: $filter, option: $option, sort: $sort) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            id
            message_id
            channel_id
            sort_id
            message_type
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            attachment_filenames {
              __typename
              name
              size
              type
              url
            }
            has
            embed_providers
            embed_type
            parent_message_id
            parent_message {
              __typename
              id
              message_id
              channel_id
              sort_id
              message_type
              sender {
                __typename
                id
                name
                profile
              }
              admin {
                __typename
                id
                name
                profile
              }
              attachment_filenames {
                __typename
                name
                size
                type
                url
              }
              has
              embed_providers
              embed_type
              isExpress
              link_hostnames
              mentions
              bytes
              mentions_everyone
              content
              sended_at
              created_at
            }
            isExpress
            link_hostnames
            mentions
            bytes
            mentions_everyone
            content
            sended_at
            created_at
          }
        }
      }
    }
    """

  public let operationName: String = "messages"

  public var projectId: String
  public var filter: String
  public var option: String?
  public var sort: String?

  public init(projectId: String, filter: String, option: String? = nil, sort: String? = nil) {
    self.projectId = projectId
    self.filter = filter
    self.option = option
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "filter": filter, "option": option, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("messages", arguments: ["projectId": GraphQLVariable("projectId"), "filter": GraphQLVariable("filter"), "option": GraphQLVariable("option"), "sort": GraphQLVariable("sort")], type: .object(Message.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(messages: Message? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "messages": messages.flatMap { (value: Message) -> ResultMap in value.resultMap }])
    }

    public var messages: Message? {
      get {
        return (resultMap["messages"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "messages")
      }
    }

    public struct Message: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MessagesConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MessagesConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MessagesEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessagesEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Messages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("embed_providers", type: .scalar(String.self)),
              GraphQLField("embed_type", type: .scalar(String.self)),
              GraphQLField("parent_message_id", type: .scalar(String.self)),
              GraphQLField("parent_message", type: .object(ParentMessage.selections)),
              GraphQLField("isExpress", type: .scalar(Bool.self)),
              GraphQLField("link_hostnames", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("bytes", type: .scalar(Int.self)),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("sended_at", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, messageId: String, channelId: String, sortId: String, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, parentMessageId: String? = nil, parentMessage: ParentMessage? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Messages", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "parent_message_id": parentMessageId, "parent_message": parentMessage.flatMap { (value: ParentMessage) -> ResultMap in value.resultMap }, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var messageId: String {
            get {
              return resultMap["message_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var sortId: String {
            get {
              return resultMap["sort_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var attachmentFilenames: AttachmentFilename? {
            get {
              return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var embedProviders: String? {
            get {
              return resultMap["embed_providers"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_providers")
            }
          }

          public var embedType: String? {
            get {
              return resultMap["embed_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_type")
            }
          }

          public var parentMessageId: String? {
            get {
              return resultMap["parent_message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "parent_message_id")
            }
          }

          public var parentMessage: ParentMessage? {
            get {
              return (resultMap["parent_message"] as? ResultMap).flatMap { ParentMessage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "parent_message")
            }
          }

          public var isExpress: Bool? {
            get {
              return resultMap["isExpress"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isExpress")
            }
          }

          public var linkHostnames: String? {
            get {
              return resultMap["link_hostnames"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "link_hostnames")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var bytes: Int? {
            get {
              return resultMap["bytes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "bytes")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var sendedAt: String? {
            get {
              return resultMap["sended_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sended_at")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct AttachmentFilename: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Attachment"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("size", type: .scalar(Double.self)),
                GraphQLField("type", type: .scalar(String.self)),
                GraphQLField("url", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var size: Double? {
              get {
                return resultMap["size"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "size")
              }
            }

            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct ParentMessage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MessageParentType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("message_id", type: .scalar(String.self)),
                GraphQLField("channel_id", type: .scalar(String.self)),
                GraphQLField("sort_id", type: .scalar(String.self)),
                GraphQLField("message_type", type: .scalar(String.self)),
                GraphQLField("sender", type: .object(Sender.selections)),
                GraphQLField("admin", type: .object(Admin.selections)),
                GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
                GraphQLField("has", type: .scalar(String.self)),
                GraphQLField("embed_providers", type: .scalar(String.self)),
                GraphQLField("embed_type", type: .scalar(String.self)),
                GraphQLField("isExpress", type: .scalar(Bool.self)),
                GraphQLField("link_hostnames", type: .scalar(String.self)),
                GraphQLField("mentions", type: .list(.scalar(String.self))),
                GraphQLField("bytes", type: .scalar(Int.self)),
                GraphQLField("mentions_everyone", type: .scalar(String.self)),
                GraphQLField("content", type: .scalar(String.self)),
                GraphQLField("sended_at", type: .scalar(String.self)),
                GraphQLField("created_at", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, messageId: String? = nil, channelId: String? = nil, sortId: String? = nil, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MessageParentType", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var messageId: String? {
              get {
                return resultMap["message_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message_id")
              }
            }

            public var channelId: String? {
              get {
                return resultMap["channel_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "channel_id")
              }
            }

            public var sortId: String? {
              get {
                return resultMap["sort_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "sort_id")
              }
            }

            public var messageType: String? {
              get {
                return resultMap["message_type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message_type")
              }
            }

            public var sender: Sender? {
              get {
                return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "sender")
              }
            }

            public var admin: Admin? {
              get {
                return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "admin")
              }
            }

            public var attachmentFilenames: AttachmentFilename? {
              get {
                return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
              }
            }

            public var has: String? {
              get {
                return resultMap["has"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "has")
              }
            }

            public var embedProviders: String? {
              get {
                return resultMap["embed_providers"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "embed_providers")
              }
            }

            public var embedType: String? {
              get {
                return resultMap["embed_type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "embed_type")
              }
            }

            public var isExpress: Bool? {
              get {
                return resultMap["isExpress"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isExpress")
              }
            }

            public var linkHostnames: String? {
              get {
                return resultMap["link_hostnames"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "link_hostnames")
              }
            }

            public var mentions: [String?]? {
              get {
                return resultMap["mentions"] as? [String?]
              }
              set {
                resultMap.updateValue(newValue, forKey: "mentions")
              }
            }

            public var bytes: Int? {
              get {
                return resultMap["bytes"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "bytes")
              }
            }

            public var mentionsEveryone: String? {
              get {
                return resultMap["mentions_everyone"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mentions_everyone")
              }
            }

            public var content: String? {
              get {
                return resultMap["content"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "content")
              }
            }

            public var sendedAt: String? {
              get {
                return resultMap["sended_at"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "sended_at")
              }
            }

            public var createdAt: String? {
              get {
                return resultMap["created_at"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "created_at")
              }
            }

            public struct Sender: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Sender"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(String.self)),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("profile", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String? {
                get {
                  return resultMap["id"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var profile: String? {
                get {
                  return resultMap["profile"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profile")
                }
              }
            }

            public struct Admin: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Sender"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(String.self)),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("profile", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: String? {
                get {
                  return resultMap["id"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var profile: String? {
                get {
                  return resultMap["profile"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profile")
                }
              }
            }

            public struct AttachmentFilename: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Attachment"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .scalar(String.self)),
                  GraphQLField("size", type: .scalar(Double.self)),
                  GraphQLField("type", type: .scalar(String.self)),
                  GraphQLField("url", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var size: Double? {
                get {
                  return resultMap["size"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "size")
                }
              }

              public var type: String? {
                get {
                  return resultMap["type"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              public var url: String? {
                get {
                  return resultMap["url"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class MarkQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query mark($projectId: String!, $channelId: String!) {
      mark(projectId: $projectId, channelId: $channelId) {
        __typename
        user_id
        message_id
        sort_id
        unread
      }
    }
    """

  public let operationName: String = "mark"

  public var projectId: String
  public var channelId: String

  public init(projectId: String, channelId: String) {
    self.projectId = projectId
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("mark", arguments: ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId")], type: .object(Mark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mark: Mark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }])
    }

    public var mark: Mark? {
      get {
        return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "mark")
      }
    }

    public struct Mark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mark"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("message_id", type: .scalar(String.self)),
          GraphQLField("sort_id", type: .scalar(String.self)),
          GraphQLField("unread", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var messageId: String? {
        get {
          return resultMap["message_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_id")
        }
      }

      public var sortId: String? {
        get {
          return resultMap["sort_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "sort_id")
        }
      }

      public var unread: Int? {
        get {
          return resultMap["unread"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "unread")
        }
      }
    }
  }
}

public final class CreateChannelMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createChannelMessage($projectId: String!, $channelId: String!, $content: String!) {
      createChannelMessage(
        input: {projectId: $projectId, channelId: $channelId, content: $content}
      ) {
        __typename
        message {
          __typename
          id
          message_id
          channel_id
          sort_id
          message_type
          sender {
            __typename
            id
            name
            profile
          }
          admin {
            __typename
            id
            name
            profile
          }
          attachment_filenames {
            __typename
            name
            size
            type
            url
          }
          has
          embed_providers
          embed_type
          parent_message_id
          parent_message {
            __typename
            id
            message_id
            channel_id
            sort_id
            message_type
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            attachment_filenames {
              __typename
              name
              size
              type
              url
            }
            has
            embed_providers
            embed_type
            isExpress
            link_hostnames
            mentions
            bytes
            mentions_everyone
            content
            sended_at
            created_at
          }
          isExpress
          link_hostnames
          mentions
          bytes
          mentions_everyone
          content
          sended_at
          created_at
        }
      }
    }
    """

  public let operationName: String = "createChannelMessage"

  public var projectId: String
  public var channelId: String
  public var content: String

  public init(projectId: String, channelId: String, content: String) {
    self.projectId = projectId
    self.channelId = channelId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createChannelMessage", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "content": GraphQLVariable("content")]], type: .object(CreateChannelMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createChannelMessage: CreateChannelMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createChannelMessage": createChannelMessage.flatMap { (value: CreateChannelMessage) -> ResultMap in value.resultMap }])
    }

    public var createChannelMessage: CreateChannelMessage? {
      get {
        return (resultMap["createChannelMessage"] as? ResultMap).flatMap { CreateChannelMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createChannelMessage")
      }
    }

    public struct CreateChannelMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createChannelMessagePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .object(Message.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message? = nil) {
        self.init(unsafeResultMap: ["__typename": "createChannelMessagePayload", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message? {
        get {
          return (resultMap["message"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "message")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Messages"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_type", type: .scalar(String.self)),
            GraphQLField("sender", type: .object(Sender.selections)),
            GraphQLField("admin", type: .object(Admin.selections)),
            GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
            GraphQLField("has", type: .scalar(String.self)),
            GraphQLField("embed_providers", type: .scalar(String.self)),
            GraphQLField("embed_type", type: .scalar(String.self)),
            GraphQLField("parent_message_id", type: .scalar(String.self)),
            GraphQLField("parent_message", type: .object(ParentMessage.selections)),
            GraphQLField("isExpress", type: .scalar(Bool.self)),
            GraphQLField("link_hostnames", type: .scalar(String.self)),
            GraphQLField("mentions", type: .list(.scalar(String.self))),
            GraphQLField("bytes", type: .scalar(Int.self)),
            GraphQLField("mentions_everyone", type: .scalar(String.self)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("sended_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, messageId: String, channelId: String, sortId: String, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, parentMessageId: String? = nil, parentMessage: ParentMessage? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Messages", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "parent_message_id": parentMessageId, "parent_message": parentMessage.flatMap { (value: ParentMessage) -> ResultMap in value.resultMap }, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var messageId: String {
          get {
            return resultMap["message_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var sortId: String {
          get {
            return resultMap["sort_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sort_id")
          }
        }

        public var messageType: String? {
          get {
            return resultMap["message_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_type")
          }
        }

        public var sender: Sender? {
          get {
            return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "sender")
          }
        }

        public var admin: Admin? {
          get {
            return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "admin")
          }
        }

        public var attachmentFilenames: AttachmentFilename? {
          get {
            return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
          }
        }

        public var has: String? {
          get {
            return resultMap["has"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "has")
          }
        }

        public var embedProviders: String? {
          get {
            return resultMap["embed_providers"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_providers")
          }
        }

        public var embedType: String? {
          get {
            return resultMap["embed_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_type")
          }
        }

        public var parentMessageId: String? {
          get {
            return resultMap["parent_message_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "parent_message_id")
          }
        }

        public var parentMessage: ParentMessage? {
          get {
            return (resultMap["parent_message"] as? ResultMap).flatMap { ParentMessage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "parent_message")
          }
        }

        public var isExpress: Bool? {
          get {
            return resultMap["isExpress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isExpress")
          }
        }

        public var linkHostnames: String? {
          get {
            return resultMap["link_hostnames"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_hostnames")
          }
        }

        public var mentions: [String?]? {
          get {
            return resultMap["mentions"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions")
          }
        }

        public var bytes: Int? {
          get {
            return resultMap["bytes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "bytes")
          }
        }

        public var mentionsEveryone: String? {
          get {
            return resultMap["mentions_everyone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions_everyone")
          }
        }

        public var content: String? {
          get {
            return resultMap["content"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var sendedAt: String? {
          get {
            return resultMap["sended_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sended_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Admin: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct AttachmentFilename: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Attachment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("size", type: .scalar(Double.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var size: Double? {
            get {
              return resultMap["size"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "size")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct ParentMessage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MessageParentType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("message_id", type: .scalar(String.self)),
              GraphQLField("channel_id", type: .scalar(String.self)),
              GraphQLField("sort_id", type: .scalar(String.self)),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("embed_providers", type: .scalar(String.self)),
              GraphQLField("embed_type", type: .scalar(String.self)),
              GraphQLField("isExpress", type: .scalar(Bool.self)),
              GraphQLField("link_hostnames", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("bytes", type: .scalar(Int.self)),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("sended_at", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, messageId: String? = nil, channelId: String? = nil, sortId: String? = nil, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MessageParentType", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var messageId: String? {
            get {
              return resultMap["message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var channelId: String? {
            get {
              return resultMap["channel_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var sortId: String? {
            get {
              return resultMap["sort_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var attachmentFilenames: AttachmentFilename? {
            get {
              return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var embedProviders: String? {
            get {
              return resultMap["embed_providers"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_providers")
            }
          }

          public var embedType: String? {
            get {
              return resultMap["embed_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_type")
            }
          }

          public var isExpress: Bool? {
            get {
              return resultMap["isExpress"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isExpress")
            }
          }

          public var linkHostnames: String? {
            get {
              return resultMap["link_hostnames"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "link_hostnames")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var bytes: Int? {
            get {
              return resultMap["bytes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "bytes")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var sendedAt: String? {
            get {
              return resultMap["sended_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sended_at")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct AttachmentFilename: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Attachment"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("size", type: .scalar(Double.self)),
                GraphQLField("type", type: .scalar(String.self)),
                GraphQLField("url", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var size: Double? {
              get {
                return resultMap["size"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "size")
              }
            }

            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }
      }
    }
  }
}

public final class DeleteMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteMessage($projectId: String!, $channelId: String!, $id: ID!) {
      deleteMessage(input: {projectId: $projectId, channelId: $channelId, id: $id}) {
        __typename
        message {
          __typename
          id
          message_id
          channel_id
          sort_id
          message_type
          sender {
            __typename
            id
            name
            profile
          }
          admin {
            __typename
            id
            name
            profile
          }
          attachment_filenames {
            __typename
            name
            size
            type
            url
          }
          has
          embed_providers
          embed_type
          parent_message_id
          parent_message {
            __typename
            id
            message_id
            channel_id
            sort_id
            message_type
            sender {
              __typename
              id
              name
              profile
            }
            admin {
              __typename
              id
              name
              profile
            }
            attachment_filenames {
              __typename
              name
              size
              type
              url
            }
            has
            embed_providers
            embed_type
            isExpress
            link_hostnames
            mentions
            bytes
            mentions_everyone
            content
            sended_at
            created_at
          }
          isExpress
          link_hostnames
          mentions
          bytes
          mentions_everyone
          content
          sended_at
          created_at
        }
      }
    }
    """

  public let operationName: String = "deleteMessage"

  public var projectId: String
  public var channelId: String
  public var id: GraphQLID

  public init(projectId: String, channelId: String, id: GraphQLID) {
    self.projectId = projectId
    self.channelId = channelId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteMessage", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "id": GraphQLVariable("id")]], type: .object(DeleteMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMessage: DeleteMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMessage": deleteMessage.flatMap { (value: DeleteMessage) -> ResultMap in value.resultMap }])
    }

    public var deleteMessage: DeleteMessage? {
      get {
        return (resultMap["deleteMessage"] as? ResultMap).flatMap { DeleteMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteMessage")
      }
    }

    public struct DeleteMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["deleteMessagePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .object(Message.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message? = nil) {
        self.init(unsafeResultMap: ["__typename": "deleteMessagePayload", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message? {
        get {
          return (resultMap["message"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "message")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Messages"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("sort_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_type", type: .scalar(String.self)),
            GraphQLField("sender", type: .object(Sender.selections)),
            GraphQLField("admin", type: .object(Admin.selections)),
            GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
            GraphQLField("has", type: .scalar(String.self)),
            GraphQLField("embed_providers", type: .scalar(String.self)),
            GraphQLField("embed_type", type: .scalar(String.self)),
            GraphQLField("parent_message_id", type: .scalar(String.self)),
            GraphQLField("parent_message", type: .object(ParentMessage.selections)),
            GraphQLField("isExpress", type: .scalar(Bool.self)),
            GraphQLField("link_hostnames", type: .scalar(String.self)),
            GraphQLField("mentions", type: .list(.scalar(String.self))),
            GraphQLField("bytes", type: .scalar(Int.self)),
            GraphQLField("mentions_everyone", type: .scalar(String.self)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("sended_at", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, messageId: String, channelId: String, sortId: String, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, parentMessageId: String? = nil, parentMessage: ParentMessage? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Messages", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "parent_message_id": parentMessageId, "parent_message": parentMessage.flatMap { (value: ParentMessage) -> ResultMap in value.resultMap }, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var messageId: String {
          get {
            return resultMap["message_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var sortId: String {
          get {
            return resultMap["sort_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sort_id")
          }
        }

        public var messageType: String? {
          get {
            return resultMap["message_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_type")
          }
        }

        public var sender: Sender? {
          get {
            return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "sender")
          }
        }

        public var admin: Admin? {
          get {
            return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "admin")
          }
        }

        public var attachmentFilenames: AttachmentFilename? {
          get {
            return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
          }
        }

        public var has: String? {
          get {
            return resultMap["has"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "has")
          }
        }

        public var embedProviders: String? {
          get {
            return resultMap["embed_providers"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_providers")
          }
        }

        public var embedType: String? {
          get {
            return resultMap["embed_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "embed_type")
          }
        }

        public var parentMessageId: String? {
          get {
            return resultMap["parent_message_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "parent_message_id")
          }
        }

        public var parentMessage: ParentMessage? {
          get {
            return (resultMap["parent_message"] as? ResultMap).flatMap { ParentMessage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "parent_message")
          }
        }

        public var isExpress: Bool? {
          get {
            return resultMap["isExpress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isExpress")
          }
        }

        public var linkHostnames: String? {
          get {
            return resultMap["link_hostnames"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link_hostnames")
          }
        }

        public var mentions: [String?]? {
          get {
            return resultMap["mentions"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions")
          }
        }

        public var bytes: Int? {
          get {
            return resultMap["bytes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "bytes")
          }
        }

        public var mentionsEveryone: String? {
          get {
            return resultMap["mentions_everyone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mentions_everyone")
          }
        }

        public var content: String? {
          get {
            return resultMap["content"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var sendedAt: String? {
          get {
            return resultMap["sended_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sended_at")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct Admin: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Sender"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }

        public struct AttachmentFilename: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Attachment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("size", type: .scalar(Double.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var size: Double? {
            get {
              return resultMap["size"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "size")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct ParentMessage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MessageParentType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("message_id", type: .scalar(String.self)),
              GraphQLField("channel_id", type: .scalar(String.self)),
              GraphQLField("sort_id", type: .scalar(String.self)),
              GraphQLField("message_type", type: .scalar(String.self)),
              GraphQLField("sender", type: .object(Sender.selections)),
              GraphQLField("admin", type: .object(Admin.selections)),
              GraphQLField("attachment_filenames", type: .object(AttachmentFilename.selections)),
              GraphQLField("has", type: .scalar(String.self)),
              GraphQLField("embed_providers", type: .scalar(String.self)),
              GraphQLField("embed_type", type: .scalar(String.self)),
              GraphQLField("isExpress", type: .scalar(Bool.self)),
              GraphQLField("link_hostnames", type: .scalar(String.self)),
              GraphQLField("mentions", type: .list(.scalar(String.self))),
              GraphQLField("bytes", type: .scalar(Int.self)),
              GraphQLField("mentions_everyone", type: .scalar(String.self)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("sended_at", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, messageId: String? = nil, channelId: String? = nil, sortId: String? = nil, messageType: String? = nil, sender: Sender? = nil, admin: Admin? = nil, attachmentFilenames: AttachmentFilename? = nil, has: String? = nil, embedProviders: String? = nil, embedType: String? = nil, isExpress: Bool? = nil, linkHostnames: String? = nil, mentions: [String?]? = nil, bytes: Int? = nil, mentionsEveryone: String? = nil, content: String? = nil, sendedAt: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MessageParentType", "id": id, "message_id": messageId, "channel_id": channelId, "sort_id": sortId, "message_type": messageType, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "admin": admin.flatMap { (value: Admin) -> ResultMap in value.resultMap }, "attachment_filenames": attachmentFilenames.flatMap { (value: AttachmentFilename) -> ResultMap in value.resultMap }, "has": has, "embed_providers": embedProviders, "embed_type": embedType, "isExpress": isExpress, "link_hostnames": linkHostnames, "mentions": mentions, "bytes": bytes, "mentions_everyone": mentionsEveryone, "content": content, "sended_at": sendedAt, "created_at": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var messageId: String? {
            get {
              return resultMap["message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var channelId: String? {
            get {
              return resultMap["channel_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var sortId: String? {
            get {
              return resultMap["sort_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var messageType: String? {
            get {
              return resultMap["message_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_type")
            }
          }

          public var sender: Sender? {
            get {
              return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "sender")
            }
          }

          public var admin: Admin? {
            get {
              return (resultMap["admin"] as? ResultMap).flatMap { Admin(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "admin")
            }
          }

          public var attachmentFilenames: AttachmentFilename? {
            get {
              return (resultMap["attachment_filenames"] as? ResultMap).flatMap { AttachmentFilename(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "attachment_filenames")
            }
          }

          public var has: String? {
            get {
              return resultMap["has"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "has")
            }
          }

          public var embedProviders: String? {
            get {
              return resultMap["embed_providers"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_providers")
            }
          }

          public var embedType: String? {
            get {
              return resultMap["embed_type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "embed_type")
            }
          }

          public var isExpress: Bool? {
            get {
              return resultMap["isExpress"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isExpress")
            }
          }

          public var linkHostnames: String? {
            get {
              return resultMap["link_hostnames"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "link_hostnames")
            }
          }

          public var mentions: [String?]? {
            get {
              return resultMap["mentions"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions")
            }
          }

          public var bytes: Int? {
            get {
              return resultMap["bytes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "bytes")
            }
          }

          public var mentionsEveryone: String? {
            get {
              return resultMap["mentions_everyone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mentions_everyone")
            }
          }

          public var content: String? {
            get {
              return resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var sendedAt: String? {
            get {
              return resultMap["sended_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sended_at")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public struct Sender: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct Admin: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Sender"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Sender", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }

          public struct AttachmentFilename: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Attachment"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("size", type: .scalar(Double.self)),
                GraphQLField("type", type: .scalar(String.self)),
                GraphQLField("url", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil, size: Double? = nil, type: String? = nil, url: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "size": size, "type": type, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var size: Double? {
              get {
                return resultMap["size"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "size")
              }
            }

            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }
      }
    }
  }
}

public final class PinQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pin($projectId: String!, $channelId: String!, $id: String!) {
      pin(projectId: $projectId, channelId: $channelId, id: $id) {
        __typename
        id
        project_id
        channel_id
        message_id
        pinned
        pinnedAt
        user {
          __typename
          id
          name
          profile
        }
        expiredAt
        createdAt
      }
    }
    """

  public let operationName: String = "pin"

  public var projectId: String
  public var channelId: String
  public var id: String

  public init(projectId: String, channelId: String, id: String) {
    self.projectId = projectId
    self.channelId = channelId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pin", arguments: ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "id": GraphQLVariable("id")], type: .object(Pin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pin: Pin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pin": pin.flatMap { (value: Pin) -> ResultMap in value.resultMap }])
    }

    public var pin: Pin? {
      get {
        return (resultMap["pin"] as? ResultMap).flatMap { Pin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "pin")
      }
    }

    public struct Pin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Pin"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("pinned", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("pinnedAt", type: .scalar(String.self)),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("expiredAt", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, projectId: String, channelId: String, messageId: String, pinned: Bool, pinnedAt: String? = nil, user: User? = nil, expiredAt: String? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pin", "id": id, "project_id": projectId, "channel_id": channelId, "message_id": messageId, "pinned": pinned, "pinnedAt": pinnedAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "expiredAt": expiredAt, "createdAt": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var projectId: String {
        get {
          return resultMap["project_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "project_id")
        }
      }

      public var channelId: String {
        get {
          return resultMap["channel_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_id")
        }
      }

      public var messageId: String {
        get {
          return resultMap["message_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message_id")
        }
      }

      public var pinned: Bool {
        get {
          return resultMap["pinned"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "pinned")
        }
      }

      public var pinnedAt: String? {
        get {
          return resultMap["pinnedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "pinnedAt")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var expiredAt: String? {
        get {
          return resultMap["expiredAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "expiredAt")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Members"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }
      }
    }
  }
}

public final class PinsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pins($projectId: String!, $channelId: String!, $filter: String!, $option: String, $sort: String) {
      pins(
        projectId: $projectId
        channelId: $channelId
        filter: $filter
        option: $option
        sort: $sort
      ) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            id
            project_id
            channel_id
            message_id
            pinned
            pinnedAt
            user {
              __typename
              id
              name
              profile
            }
            expiredAt
            createdAt
          }
        }
      }
    }
    """

  public let operationName: String = "pins"

  public var projectId: String
  public var channelId: String
  public var filter: String
  public var option: String?
  public var sort: String?

  public init(projectId: String, channelId: String, filter: String, option: String? = nil, sort: String? = nil) {
    self.projectId = projectId
    self.channelId = channelId
    self.filter = filter
    self.option = option
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "filter": filter, "option": option, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pins", arguments: ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "filter": GraphQLVariable("filter"), "option": GraphQLVariable("option"), "sort": GraphQLVariable("sort")], type: .object(Pin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pins: Pin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pins": pins.flatMap { (value: Pin) -> ResultMap in value.resultMap }])
    }

    public var pins: Pin? {
      get {
        return (resultMap["pins"] as? ResultMap).flatMap { Pin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "pins")
      }
    }

    public struct Pin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PinConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "PinConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PinEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "PinEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Pin"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("pinned", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("pinnedAt", type: .scalar(String.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("expiredAt", type: .scalar(String.self)),
              GraphQLField("createdAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, projectId: String, channelId: String, messageId: String, pinned: Bool, pinnedAt: String? = nil, user: User? = nil, expiredAt: String? = nil, createdAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Pin", "id": id, "project_id": projectId, "channel_id": channelId, "message_id": messageId, "pinned": pinned, "pinnedAt": pinnedAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "expiredAt": expiredAt, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var projectId: String {
            get {
              return resultMap["project_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "project_id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var messageId: String {
            get {
              return resultMap["message_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var pinned: Bool {
            get {
              return resultMap["pinned"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "pinned")
            }
          }

          public var pinnedAt: String? {
            get {
              return resultMap["pinnedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "pinnedAt")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var expiredAt: String? {
            get {
              return resultMap["expiredAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "expiredAt")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Members"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }
          }
        }
      }
    }
  }
}

public final class CreatePinMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createPin($projectId: String!, $channelId: String!, $messageId: String!, $pinned: Boolean!, $pinnedAt: String, $expiredAt: String) {
      createPin(
        input: {projectId: $projectId, channelId: $channelId, messageId: $messageId, pinned: $pinned, pinnedAt: $pinnedAt, expiredAt: $expiredAt}
      ) {
        __typename
        pin {
          __typename
          id
          project_id
          channel_id
          message_id
          pinned
          pinnedAt
          user {
            __typename
            id
            name
            profile
          }
          expiredAt
          createdAt
        }
      }
    }
    """

  public let operationName: String = "createPin"

  public var projectId: String
  public var channelId: String
  public var messageId: String
  public var pinned: Bool
  public var pinnedAt: String?
  public var expiredAt: String?

  public init(projectId: String, channelId: String, messageId: String, pinned: Bool, pinnedAt: String? = nil, expiredAt: String? = nil) {
    self.projectId = projectId
    self.channelId = channelId
    self.messageId = messageId
    self.pinned = pinned
    self.pinnedAt = pinnedAt
    self.expiredAt = expiredAt
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "messageId": messageId, "pinned": pinned, "pinnedAt": pinnedAt, "expiredAt": expiredAt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createPin", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "messageId": GraphQLVariable("messageId"), "pinned": GraphQLVariable("pinned"), "pinnedAt": GraphQLVariable("pinnedAt"), "expiredAt": GraphQLVariable("expiredAt")]], type: .object(CreatePin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPin: CreatePin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPin": createPin.flatMap { (value: CreatePin) -> ResultMap in value.resultMap }])
    }

    /// Create a pin.
    public var createPin: CreatePin? {
      get {
        return (resultMap["createPin"] as? ResultMap).flatMap { CreatePin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPin")
      }
    }

    public struct CreatePin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createPinPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pin", type: .object(Pin.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pin: Pin? = nil) {
        self.init(unsafeResultMap: ["__typename": "createPinPayload", "pin": pin.flatMap { (value: Pin) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pin: Pin? {
        get {
          return (resultMap["pin"] as? ResultMap).flatMap { Pin(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pin")
        }
      }

      public struct Pin: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pin"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("pinned", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("pinnedAt", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("expiredAt", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String, channelId: String, messageId: String, pinned: Bool, pinnedAt: String? = nil, user: User? = nil, expiredAt: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pin", "id": id, "project_id": projectId, "channel_id": channelId, "message_id": messageId, "pinned": pinned, "pinnedAt": pinnedAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "expiredAt": expiredAt, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var messageId: String {
          get {
            return resultMap["message_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var pinned: Bool {
          get {
            return resultMap["pinned"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "pinned")
          }
        }

        public var pinnedAt: String? {
          get {
            return resultMap["pinnedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "pinnedAt")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var expiredAt: String? {
          get {
            return resultMap["expiredAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expiredAt")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class UpdatePinMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updatePin($id: ID!, $projectId: String!, $channelId: String!, $pinned: Boolean!, $pinnedAt: String, $expiredAt: String) {
      updatePin(
        input: {id: $id, projectId: $projectId, channelId: $channelId, pinned: $pinned, pinnedAt: $pinnedAt, expiredAt: $expiredAt}
      ) {
        __typename
        pin {
          __typename
          id
          project_id
          channel_id
          message_id
          pinned
          pinnedAt
          user {
            __typename
            id
            name
            profile
          }
          expiredAt
          createdAt
        }
      }
    }
    """

  public let operationName: String = "updatePin"

  public var id: GraphQLID
  public var projectId: String
  public var channelId: String
  public var pinned: Bool
  public var pinnedAt: String?
  public var expiredAt: String?

  public init(id: GraphQLID, projectId: String, channelId: String, pinned: Bool, pinnedAt: String? = nil, expiredAt: String? = nil) {
    self.id = id
    self.projectId = projectId
    self.channelId = channelId
    self.pinned = pinned
    self.pinnedAt = pinnedAt
    self.expiredAt = expiredAt
  }

  public var variables: GraphQLMap? {
    return ["id": id, "projectId": projectId, "channelId": channelId, "pinned": pinned, "pinnedAt": pinnedAt, "expiredAt": expiredAt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updatePin", arguments: ["input": ["id": GraphQLVariable("id"), "projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "pinned": GraphQLVariable("pinned"), "pinnedAt": GraphQLVariable("pinnedAt"), "expiredAt": GraphQLVariable("expiredAt")]], type: .object(UpdatePin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePin: UpdatePin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updatePin": updatePin.flatMap { (value: UpdatePin) -> ResultMap in value.resultMap }])
    }

    /// Update a pin.
    public var updatePin: UpdatePin? {
      get {
        return (resultMap["updatePin"] as? ResultMap).flatMap { UpdatePin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updatePin")
      }
    }

    public struct UpdatePin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["updatePinPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pin", type: .object(Pin.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pin: Pin? = nil) {
        self.init(unsafeResultMap: ["__typename": "updatePinPayload", "pin": pin.flatMap { (value: Pin) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pin: Pin? {
        get {
          return (resultMap["pin"] as? ResultMap).flatMap { Pin(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pin")
        }
      }

      public struct Pin: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pin"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("project_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("message_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("pinned", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("pinnedAt", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("expiredAt", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, projectId: String, channelId: String, messageId: String, pinned: Bool, pinnedAt: String? = nil, user: User? = nil, expiredAt: String? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pin", "id": id, "project_id": projectId, "channel_id": channelId, "message_id": messageId, "pinned": pinned, "pinnedAt": pinnedAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "expiredAt": expiredAt, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var projectId: String {
          get {
            return resultMap["project_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "project_id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var messageId: String {
          get {
            return resultMap["message_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var pinned: Bool {
          get {
            return resultMap["pinned"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "pinned")
          }
        }

        public var pinnedAt: String? {
          get {
            return resultMap["pinnedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "pinnedAt")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var expiredAt: String? {
          get {
            return resultMap["expiredAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expiredAt")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }
        }
      }
    }
  }
}

public final class ProjectQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query project($id: ID!, $ncpId: String!) {
      project(id: $id, ncpId: $ncpId) {
        __typename
        ncp_project_id
        name
      }
    }
    """

  public let operationName: String = "project"

  public var id: GraphQLID
  public var ncpId: String

  public init(id: GraphQLID, ncpId: String) {
    self.id = id
    self.ncpId = ncpId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "ncpId": ncpId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("project", arguments: ["id": GraphQLVariable("id"), "ncpId": GraphQLVariable("ncpId")], type: .object(Project.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(project: Project? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "project": project.flatMap { (value: Project) -> ResultMap in value.resultMap }])
    }

    public var project: Project? {
      get {
        return (resultMap["project"] as? ResultMap).flatMap { Project(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "project")
      }
    }

    public struct Project: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Projects"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ncp_project_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ncpProjectId: String, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Projects", "ncp_project_id": ncpProjectId, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ncpProjectId: String {
        get {
          return resultMap["ncp_project_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ncp_project_id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class CreateSubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createSubscription($projectId: String!, $channelId: String!, $option: String) {
      createSubscription(
        input: {projectId: $projectId, channelId: $channelId, option: $option}
      ) {
        __typename
        subscription {
          __typename
          id
          channel_id
          user_id
          user {
            __typename
            id
            name
            profile
            customField
          }
          language
          push
          mute
          online
          channel {
            __typename
            name
            type
            image_url
            push
            disabled
          }
          mark {
            __typename
            user_id
            message_id
            sort_id
            unread
          }
          uniquekey
          created_at
          updated_at
        }
      }
    }
    """

  public let operationName: String = "createSubscription"

  public var projectId: String
  public var channelId: String
  public var option: String?

  public init(projectId: String, channelId: String, option: String? = nil) {
    self.projectId = projectId
    self.channelId = channelId
    self.option = option
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "option": option]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createSubscription", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "option": GraphQLVariable("option")]], type: .object(CreateSubscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createSubscription: CreateSubscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createSubscription": createSubscription.flatMap { (value: CreateSubscription) -> ResultMap in value.resultMap }])
    }

    /// Create a Subscription.
    public var createSubscription: CreateSubscription? {
      get {
        return (resultMap["createSubscription"] as? ResultMap).flatMap { CreateSubscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createSubscription")
      }
    }

    public struct CreateSubscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createSubscriptionPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("subscription", type: .object(Subscription.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(subscription: Subscription? = nil) {
        self.init(unsafeResultMap: ["__typename": "createSubscriptionPayload", "subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var subscription: Subscription? {
        get {
          return (resultMap["subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subscription")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subscription"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("language", type: .scalar(String.self)),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("mute", type: .scalar(Bool.self)),
            GraphQLField("online", type: .scalar(Bool.self)),
            GraphQLField("channel", type: .object(Channel.selections)),
            GraphQLField("mark", type: .object(Mark.selections)),
            GraphQLField("uniquekey", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, channelId: String, userId: String, user: User? = nil, language: String? = nil, push: Bool? = nil, mute: Bool? = nil, online: Bool? = nil, channel: Channel? = nil, mark: Mark? = nil, uniquekey: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "channel_id": channelId, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "language": language, "push": push, "mute": mute, "online": online, "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }, "uniquekey": uniquekey, "created_at": createdAt, "updated_at": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var userId: String {
          get {
            return resultMap["user_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var mute: Bool? {
          get {
            return resultMap["mute"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "mute")
          }
        }

        public var online: Bool? {
          get {
            return resultMap["online"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "online")
          }
        }

        public var channel: Channel? {
          get {
            return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "channel")
          }
        }

        public var mark: Mark? {
          get {
            return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mark")
          }
        }

        public var uniquekey: String? {
          get {
            return resultMap["uniquekey"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "uniquekey")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("customField", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, customField: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "customField": customField])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          public var customField: String? {
            get {
              return resultMap["customField"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "customField")
            }
          }
        }

        public struct Channel: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Channels"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("image_url", type: .scalar(String.self)),
              GraphQLField("push", type: .scalar(Bool.self)),
              GraphQLField("disabled", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, type: String? = nil, imageUrl: String? = nil, push: Bool? = nil, disabled: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Channels", "name": name, "type": type, "image_url": imageUrl, "push": push, "disabled": disabled])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["image_url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image_url")
            }
          }

          public var push: Bool? {
            get {
              return resultMap["push"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "push")
            }
          }

          public var disabled: Bool? {
            get {
              return resultMap["disabled"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "disabled")
            }
          }
        }

        public struct Mark: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Mark"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("user_id", type: .scalar(String.self)),
              GraphQLField("message_id", type: .scalar(String.self)),
              GraphQLField("sort_id", type: .scalar(String.self)),
              GraphQLField("unread", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userId: String? {
            get {
              return resultMap["user_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user_id")
            }
          }

          public var messageId: String? {
            get {
              return resultMap["message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String? {
            get {
              return resultMap["sort_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var unread: Int? {
            get {
              return resultMap["unread"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "unread")
            }
          }
        }
      }
    }
  }
}

public final class DeleteSubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteSubscription($projectId: String!, $channelId: String!) {
      deleteSubscription(input: {projectId: $projectId, channelId: $channelId}) {
        __typename
        subscription {
          __typename
          id
          channel_id
          user_id
          user {
            __typename
            id
            name
            profile
            customField
          }
          language
          push
          mute
          online
          channel {
            __typename
            name
            type
            image_url
            push
            disabled
          }
          mark {
            __typename
            user_id
            message_id
            sort_id
            unread
          }
          uniquekey
          created_at
          updated_at
        }
      }
    }
    """

  public let operationName: String = "deleteSubscription"

  public var projectId: String
  public var channelId: String

  public init(projectId: String, channelId: String) {
    self.projectId = projectId
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteSubscription", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId")]], type: .object(DeleteSubscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteSubscription: DeleteSubscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteSubscription": deleteSubscription.flatMap { (value: DeleteSubscription) -> ResultMap in value.resultMap }])
    }

    /// Delete a Subscription.
    public var deleteSubscription: DeleteSubscription? {
      get {
        return (resultMap["deleteSubscription"] as? ResultMap).flatMap { DeleteSubscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteSubscription")
      }
    }

    public struct DeleteSubscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["deleteSubscriptionPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("subscription", type: .object(Subscription.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(subscription: Subscription? = nil) {
        self.init(unsafeResultMap: ["__typename": "deleteSubscriptionPayload", "subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var subscription: Subscription? {
        get {
          return (resultMap["subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subscription")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subscription"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("language", type: .scalar(String.self)),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("mute", type: .scalar(Bool.self)),
            GraphQLField("online", type: .scalar(Bool.self)),
            GraphQLField("channel", type: .object(Channel.selections)),
            GraphQLField("mark", type: .object(Mark.selections)),
            GraphQLField("uniquekey", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, channelId: String, userId: String, user: User? = nil, language: String? = nil, push: Bool? = nil, mute: Bool? = nil, online: Bool? = nil, channel: Channel? = nil, mark: Mark? = nil, uniquekey: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "channel_id": channelId, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "language": language, "push": push, "mute": mute, "online": online, "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }, "uniquekey": uniquekey, "created_at": createdAt, "updated_at": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var userId: String {
          get {
            return resultMap["user_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var mute: Bool? {
          get {
            return resultMap["mute"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "mute")
          }
        }

        public var online: Bool? {
          get {
            return resultMap["online"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "online")
          }
        }

        public var channel: Channel? {
          get {
            return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "channel")
          }
        }

        public var mark: Mark? {
          get {
            return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mark")
          }
        }

        public var uniquekey: String? {
          get {
            return resultMap["uniquekey"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "uniquekey")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("customField", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, customField: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "customField": customField])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          public var customField: String? {
            get {
              return resultMap["customField"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "customField")
            }
          }
        }

        public struct Channel: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Channels"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("image_url", type: .scalar(String.self)),
              GraphQLField("push", type: .scalar(Bool.self)),
              GraphQLField("disabled", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, type: String? = nil, imageUrl: String? = nil, push: Bool? = nil, disabled: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Channels", "name": name, "type": type, "image_url": imageUrl, "push": push, "disabled": disabled])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["image_url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image_url")
            }
          }

          public var push: Bool? {
            get {
              return resultMap["push"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "push")
            }
          }

          public var disabled: Bool? {
            get {
              return resultMap["disabled"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "disabled")
            }
          }
        }

        public struct Mark: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Mark"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("user_id", type: .scalar(String.self)),
              GraphQLField("message_id", type: .scalar(String.self)),
              GraphQLField("sort_id", type: .scalar(String.self)),
              GraphQLField("unread", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userId: String? {
            get {
              return resultMap["user_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user_id")
            }
          }

          public var messageId: String? {
            get {
              return resultMap["message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String? {
            get {
              return resultMap["sort_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var unread: Int? {
            get {
              return resultMap["unread"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "unread")
            }
          }
        }
      }
    }
  }
}

public final class UpdateSubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updateSubscription($projectId: String!, $channelId: String!, $mark: MarkInput, $option: String!) {
      updateSubscription(
        input: {projectId: $projectId, channelId: $channelId, mark: $mark, option: $option}
      ) {
        __typename
        subscription {
          __typename
          id
          channel_id
          user_id
          user {
            __typename
            id
            name
            profile
            customField
          }
          language
          push
          mute
          online
          channel {
            __typename
            name
            type
            image_url
            push
            disabled
          }
          mark {
            __typename
            user_id
            message_id
            sort_id
            unread
          }
          uniquekey
          created_at
          updated_at
        }
      }
    }
    """

  public let operationName: String = "updateSubscription"

  public var projectId: String
  public var channelId: String
  public var mark: MarkInput?
  public var option: String

  public init(projectId: String, channelId: String, mark: MarkInput? = nil, option: String) {
    self.projectId = projectId
    self.channelId = channelId
    self.mark = mark
    self.option = option
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "mark": mark, "option": option]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateSubscription", arguments: ["input": ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "mark": GraphQLVariable("mark"), "option": GraphQLVariable("option")]], type: .object(UpdateSubscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateSubscription: UpdateSubscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateSubscription": updateSubscription.flatMap { (value: UpdateSubscription) -> ResultMap in value.resultMap }])
    }

    /// Update a Subscription.
    public var updateSubscription: UpdateSubscription? {
      get {
        return (resultMap["updateSubscription"] as? ResultMap).flatMap { UpdateSubscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateSubscription")
      }
    }

    public struct UpdateSubscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["updateSubscriptionPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("subscription", type: .object(Subscription.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(subscription: Subscription? = nil) {
        self.init(unsafeResultMap: ["__typename": "updateSubscriptionPayload", "subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var subscription: Subscription? {
        get {
          return (resultMap["subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subscription")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Subscription"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("language", type: .scalar(String.self)),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("mute", type: .scalar(Bool.self)),
            GraphQLField("online", type: .scalar(Bool.self)),
            GraphQLField("channel", type: .object(Channel.selections)),
            GraphQLField("mark", type: .object(Mark.selections)),
            GraphQLField("uniquekey", type: .scalar(String.self)),
            GraphQLField("created_at", type: .scalar(String.self)),
            GraphQLField("updated_at", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, channelId: String, userId: String, user: User? = nil, language: String? = nil, push: Bool? = nil, mute: Bool? = nil, online: Bool? = nil, channel: Channel? = nil, mark: Mark? = nil, uniquekey: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "channel_id": channelId, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "language": language, "push": push, "mute": mute, "online": online, "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }, "uniquekey": uniquekey, "created_at": createdAt, "updated_at": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var userId: String {
          get {
            return resultMap["user_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var mute: Bool? {
          get {
            return resultMap["mute"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "mute")
          }
        }

        public var online: Bool? {
          get {
            return resultMap["online"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "online")
          }
        }

        public var channel: Channel? {
          get {
            return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "channel")
          }
        }

        public var mark: Mark? {
          get {
            return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mark")
          }
        }

        public var uniquekey: String? {
          get {
            return resultMap["uniquekey"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "uniquekey")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["created_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created_at")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated_at")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Members"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("profile", type: .scalar(String.self)),
              GraphQLField("customField", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, profile: String? = nil, customField: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "customField": customField])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profile: String? {
            get {
              return resultMap["profile"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profile")
            }
          }

          public var customField: String? {
            get {
              return resultMap["customField"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "customField")
            }
          }
        }

        public struct Channel: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Channels"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("image_url", type: .scalar(String.self)),
              GraphQLField("push", type: .scalar(Bool.self)),
              GraphQLField("disabled", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, type: String? = nil, imageUrl: String? = nil, push: Bool? = nil, disabled: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Channels", "name": name, "type": type, "image_url": imageUrl, "push": push, "disabled": disabled])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["image_url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image_url")
            }
          }

          public var push: Bool? {
            get {
              return resultMap["push"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "push")
            }
          }

          public var disabled: Bool? {
            get {
              return resultMap["disabled"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "disabled")
            }
          }
        }

        public struct Mark: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Mark"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("user_id", type: .scalar(String.self)),
              GraphQLField("message_id", type: .scalar(String.self)),
              GraphQLField("sort_id", type: .scalar(String.self)),
              GraphQLField("unread", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userId: String? {
            get {
              return resultMap["user_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user_id")
            }
          }

          public var messageId: String? {
            get {
              return resultMap["message_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message_id")
            }
          }

          public var sortId: String? {
            get {
              return resultMap["sort_id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sort_id")
            }
          }

          public var unread: Int? {
            get {
              return resultMap["unread"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "unread")
            }
          }
        }
      }
    }
  }
}

public final class SubscriptionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query subscription($projectId: String!, $channelId: String!, $id: String!) {
      subscription(projectId: $projectId, channelId: $channelId, id: $id) {
        __typename
        id
        channel_id
        user_id
        user {
          __typename
          id
          name
          profile
          customField
        }
        language
        push
        mute
        online
        channel {
          __typename
          name
          type
          image_url
          push
          disabled
        }
        mark {
          __typename
          user_id
          message_id
          sort_id
          unread
        }
        uniquekey
        created_at
        updated_at
      }
    }
    """

  public let operationName: String = "subscription"

  public var projectId: String
  public var channelId: String
  public var id: String

  public init(projectId: String, channelId: String, id: String) {
    self.projectId = projectId
    self.channelId = channelId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "channelId": channelId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subscription", arguments: ["projectId": GraphQLVariable("projectId"), "channelId": GraphQLVariable("channelId"), "id": GraphQLVariable("id")], type: .object(Subscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subscription: Subscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "subscription": subscription.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
    }

    public var subscription: Subscription? {
      get {
        return (resultMap["subscription"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subscription")
      }
    }

    public struct Subscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Subscription"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("language", type: .scalar(String.self)),
          GraphQLField("push", type: .scalar(Bool.self)),
          GraphQLField("mute", type: .scalar(Bool.self)),
          GraphQLField("online", type: .scalar(Bool.self)),
          GraphQLField("channel", type: .object(Channel.selections)),
          GraphQLField("mark", type: .object(Mark.selections)),
          GraphQLField("uniquekey", type: .scalar(String.self)),
          GraphQLField("created_at", type: .scalar(String.self)),
          GraphQLField("updated_at", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, channelId: String, userId: String, user: User? = nil, language: String? = nil, push: Bool? = nil, mute: Bool? = nil, online: Bool? = nil, channel: Channel? = nil, mark: Mark? = nil, uniquekey: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "channel_id": channelId, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "language": language, "push": push, "mute": mute, "online": online, "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }, "uniquekey": uniquekey, "created_at": createdAt, "updated_at": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var channelId: String {
        get {
          return resultMap["channel_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_id")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var language: String? {
        get {
          return resultMap["language"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var push: Bool? {
        get {
          return resultMap["push"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "push")
        }
      }

      public var mute: Bool? {
        get {
          return resultMap["mute"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "mute")
        }
      }

      public var online: Bool? {
        get {
          return resultMap["online"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "online")
        }
      }

      public var channel: Channel? {
        get {
          return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "channel")
        }
      }

      public var mark: Mark? {
        get {
          return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mark")
        }
      }

      public var uniquekey: String? {
        get {
          return resultMap["uniquekey"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "uniquekey")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["created_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created_at")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updated_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updated_at")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Members"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profile", type: .scalar(String.self)),
            GraphQLField("customField", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, profile: String? = nil, customField: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "customField": customField])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profile: String? {
          get {
            return resultMap["profile"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile")
          }
        }

        public var customField: String? {
          get {
            return resultMap["customField"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "customField")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("image_url", type: .scalar(String.self)),
            GraphQLField("push", type: .scalar(Bool.self)),
            GraphQLField("disabled", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, type: String? = nil, imageUrl: String? = nil, push: Bool? = nil, disabled: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channels", "name": name, "type": type, "image_url": imageUrl, "push": push, "disabled": disabled])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image_url")
          }
        }

        public var push: Bool? {
          get {
            return resultMap["push"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "push")
          }
        }

        public var disabled: Bool? {
          get {
            return resultMap["disabled"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "disabled")
          }
        }
      }

      public struct Mark: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mark"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user_id", type: .scalar(String.self)),
            GraphQLField("message_id", type: .scalar(String.self)),
            GraphQLField("sort_id", type: .scalar(String.self)),
            GraphQLField("unread", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var userId: String? {
          get {
            return resultMap["user_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "user_id")
          }
        }

        public var messageId: String? {
          get {
            return resultMap["message_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message_id")
          }
        }

        public var sortId: String? {
          get {
            return resultMap["sort_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sort_id")
          }
        }

        public var unread: Int? {
          get {
            return resultMap["unread"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "unread")
          }
        }
      }
    }
  }
}

public final class SubscriptionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query subscriptions($projectId: String!, $option: String!, $filter: String!, $sort: String) {
      subscriptions(
        projectId: $projectId
        option: $option
        filter: $filter
        sort: $sort
      ) {
        __typename
        totalCount
        edges {
          __typename
          node {
            __typename
            id
            channel_id
            user_id
            user {
              __typename
              id
              name
              profile
              customField
            }
            language
            push
            mute
            online
            channel {
              __typename
              name
              type
              image_url
              push
              disabled
            }
            mark {
              __typename
              user_id
              message_id
              sort_id
              unread
            }
            uniquekey
            created_at
            updated_at
          }
        }
      }
    }
    """

  public let operationName: String = "subscriptions"

  public var projectId: String
  public var option: String
  public var filter: String
  public var sort: String?

  public init(projectId: String, option: String, filter: String, sort: String? = nil) {
    self.projectId = projectId
    self.option = option
    self.filter = filter
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["projectId": projectId, "option": option, "filter": filter, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subscriptions", arguments: ["projectId": GraphQLVariable("projectId"), "option": GraphQLVariable("option"), "filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort")], type: .object(Subscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subscriptions: Subscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "subscriptions": subscriptions.flatMap { (value: Subscription) -> ResultMap in value.resultMap }])
    }

    public var subscriptions: Subscription? {
      get {
        return (resultMap["subscriptions"] as? ResultMap).flatMap { Subscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subscriptions")
      }
    }

    public struct Subscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SubscriptionsConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SubscriptionsConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SubscriptionsEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "SubscriptionsEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Subscription"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("language", type: .scalar(String.self)),
              GraphQLField("push", type: .scalar(Bool.self)),
              GraphQLField("mute", type: .scalar(Bool.self)),
              GraphQLField("online", type: .scalar(Bool.self)),
              GraphQLField("channel", type: .object(Channel.selections)),
              GraphQLField("mark", type: .object(Mark.selections)),
              GraphQLField("uniquekey", type: .scalar(String.self)),
              GraphQLField("created_at", type: .scalar(String.self)),
              GraphQLField("updated_at", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, channelId: String, userId: String, user: User? = nil, language: String? = nil, push: Bool? = nil, mute: Bool? = nil, online: Bool? = nil, channel: Channel? = nil, mark: Mark? = nil, uniquekey: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Subscription", "id": id, "channel_id": channelId, "user_id": userId, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "language": language, "push": push, "mute": mute, "online": online, "channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "mark": mark.flatMap { (value: Mark) -> ResultMap in value.resultMap }, "uniquekey": uniquekey, "created_at": createdAt, "updated_at": updatedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var channelId: String {
            get {
              return resultMap["channel_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channel_id")
            }
          }

          public var userId: String {
            get {
              return resultMap["user_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user_id")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var language: String? {
            get {
              return resultMap["language"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }

          public var push: Bool? {
            get {
              return resultMap["push"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "push")
            }
          }

          public var mute: Bool? {
            get {
              return resultMap["mute"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "mute")
            }
          }

          public var online: Bool? {
            get {
              return resultMap["online"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "online")
            }
          }

          public var channel: Channel? {
            get {
              return (resultMap["channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "channel")
            }
          }

          public var mark: Mark? {
            get {
              return (resultMap["mark"] as? ResultMap).flatMap { Mark(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "mark")
            }
          }

          public var uniquekey: String? {
            get {
              return resultMap["uniquekey"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "uniquekey")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["created_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "created_at")
            }
          }

          public var updatedAt: String? {
            get {
              return resultMap["updated_at"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updated_at")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Members"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("profile", type: .scalar(String.self)),
                GraphQLField("customField", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, profile: String? = nil, customField: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Members", "id": id, "name": name, "profile": profile, "customField": customField])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var profile: String? {
              get {
                return resultMap["profile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profile")
              }
            }

            public var customField: String? {
              get {
                return resultMap["customField"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "customField")
              }
            }
          }

          public struct Channel: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Channels"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("type", type: .scalar(String.self)),
                GraphQLField("image_url", type: .scalar(String.self)),
                GraphQLField("push", type: .scalar(Bool.self)),
                GraphQLField("disabled", type: .scalar(Bool.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil, type: String? = nil, imageUrl: String? = nil, push: Bool? = nil, disabled: Bool? = nil) {
              self.init(unsafeResultMap: ["__typename": "Channels", "name": name, "type": type, "image_url": imageUrl, "push": push, "disabled": disabled])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var type: String? {
              get {
                return resultMap["type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            public var imageUrl: String? {
              get {
                return resultMap["image_url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "image_url")
              }
            }

            public var push: Bool? {
              get {
                return resultMap["push"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "push")
              }
            }

            public var disabled: Bool? {
              get {
                return resultMap["disabled"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "disabled")
              }
            }
          }

          public struct Mark: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Mark"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("user_id", type: .scalar(String.self)),
                GraphQLField("message_id", type: .scalar(String.self)),
                GraphQLField("sort_id", type: .scalar(String.self)),
                GraphQLField("unread", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(userId: String? = nil, messageId: String? = nil, sortId: String? = nil, unread: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Mark", "user_id": userId, "message_id": messageId, "sort_id": sortId, "unread": unread])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var userId: String? {
              get {
                return resultMap["user_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "user_id")
              }
            }

            public var messageId: String? {
              get {
                return resultMap["message_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message_id")
              }
            }

            public var sortId: String? {
              get {
                return resultMap["sort_id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "sort_id")
              }
            }

            public var unread: Int? {
              get {
                return resultMap["unread"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "unread")
              }
            }
          }
        }
      }
    }
  }
}
