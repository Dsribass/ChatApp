//
//  Conversation.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 28/02/23.
//

public struct Conversation {
  public let id: Int
  public let users: [User]
  public let messages: [Message]
  public var lastMessage: Message { messages.last! }

  public init(id: Int, users: [User], messages: [Message]) {
    self.id = id
    self.users = users
    self.messages = messages
  }


  public init(id: Int, users: [User], message: Message) {
    self.init(id: id, users: users, messages: [message])
  }
}
