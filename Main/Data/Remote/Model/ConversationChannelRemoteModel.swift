//
//  ConversationChannelRemoteModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/06/23.
//

import Foundation
import Domain

struct ConversationChannelRemoteModel: RemoteModel {
  let id: String
  let users: [String]
  let messages: [MessageRemoteModel]
}

extension ConversationChannelRemoteModel {
  init(from conversation: ConversationChannel) {
    self.init(
      id: conversation.id,
      users: conversation.users.map { $0.id },
      messages: conversation.messages.map {MessageRemoteModel(from: $0)}
    )
  }

  func toConversationDomain(users: [UserRemoteModel]) -> ConversationChannel {
    return ConversationChannel(
      id: id,
      users: users
        .filterBy(idList: self.users)
        .map { $0.toUserDomain() },
      messages: messages.map { $0.toMessageDomain() }
    )
  }
}

private extension [UserRemoteModel] {
  func filterBy(idList: [String]) -> [UserRemoteModel] {
    var users: [UserRemoteModel] = []
    idList.forEach { id in
      if let user = self.first(where: { $0.id == id }) {
        users.append(user)
      }
    }
    return users
  }
}
