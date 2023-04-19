//
//  Message.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 18/04/23.
//

import Foundation

public struct Message {
  public let conversationId: Int
  public let id: Int
  public let content: String
  public let date: Date
  public let sender: User
  public let isRead: Bool
}
