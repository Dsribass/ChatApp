//
//  Message.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 18/04/23.
//

import Foundation

public struct Message {
  public let channelId: String
  public let id: String
  public let content: String
  public let date: Date
  public let sender: User
  public let isRead: Bool

  public init(channelId: String, id: String, content: String, date: Date, sender: User, isRead: Bool) {
    self.channelId = channelId
    self.id = id
    self.content = content
    self.date = date
    self.sender = sender
    self.isRead = isRead
  }

  public init(channelId: String, content: String, sender: User) {
    self.init(channelId: channelId, id: UUID().uuidString, content: content,date: Date(), sender: sender, isRead: false)
  }
}
