//
//  ConversationChannel.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 26/04/23.
//

import Foundation

public struct ConversationChannel {
  public let id: String
  public let users: [User]
  public let messages: [Message]

  public var lastMessage: Message? {
    var messages = self.messages.map { $0 }
    messages.sort { $0.date.compare($1.date) == .orderedDescending }
    return messages.first
  }

  public init(id: String, users: [User], messages: [Message] = []) {
    self.id = id
    self.users = users
    self.messages = messages
  }

  public init(users: [User]) {
    self.id = UUID().uuidString
    self.users = users
    self.messages = []
  }
}
