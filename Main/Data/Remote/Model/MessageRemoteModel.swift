//
//  MessageRemoteModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 10/05/23.
//

import Foundation
import Domain

struct MessageRemoteModel: RemoteModel {
  let channelId: String
  let id: String
  let content: String
  let date: Date
  let sender: UserRemoteModel
  let isRead: Bool
}

extension MessageRemoteModel {
  init(from message: Message) {
    self.init(
      channelId: message.channelId,
      id: message.id,
      content: message.content,
      date: message.date,
      sender: UserRemoteModel(from: message.sender),
      isRead: message.isRead)
  }

  func toMessageDomain() -> Message {
    Message(
      channelId: channelId,
      id: id,
      content: content,
      date: date,
      sender: sender.toUserDomain(),
      isRead: isRead)
  }
}
