//
//  Conversation.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 28/02/23.
//

public struct Conversation {
  public let id: Int
  public let users: [User]
  public let lastMessage: Message
}
