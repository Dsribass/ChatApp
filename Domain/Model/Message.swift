//
//  Message.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 18/04/23.
//

import Foundation

public struct Message {
  public let channelId: UUID
  public let id: UUID
  public let content: String
  public let date: Date
  public let sender: User
  public let receiver: User
  public let isRead: Bool

  public init(channelId: UUID, id: UUID, content: String, date: Date, sender: User, receiver: User, isRead: Bool) {
    self.channelId = channelId
    self.id = id
    self.content = content
    self.date = date
    self.sender = sender
    self.receiver = receiver
    self.isRead = isRead
  }

  public init(channelId: UUID, id: UUID, content: String, sender: User, receiver: User) {
    self.init(channelId: channelId, id: id, content: content,date: Date(), sender: sender, receiver: receiver, isRead: false)
  }
}
