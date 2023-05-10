//
//  ConversationChannel.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 26/04/23.
//

import Foundation

public struct ConversationChannel {
  public let id: UUID
  public let users: [User]
  public let lastMessage: Message?

  public init(id: UUID, users: [User], lastMessage: Message? = nil) {
    self.id = id
    self.users = users
    self.lastMessage = lastMessage
  }
}
