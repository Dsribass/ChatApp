//
//  SendMessage.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 09/05/23.
//

import Foundation
import RxSwift

public protocol SendMessageUseCase {
  func execute(content: String, to reicever: User, in channel: ConversationChannel?) -> Completable
}

public class SendMessage: SendMessageUseCase {
  private let getLoggedUser: GetLoggedUserUseCase
  private let conversationRepository: ConversationRepository

  public init(getLoggedUser: GetLoggedUserUseCase, conversationRepository: ConversationRepository) {
    self.getLoggedUser = getLoggedUser
    self.conversationRepository = conversationRepository
  }

  public func execute(content: String, to receiver: User, in channel: ConversationChannel?) -> Completable {
    return getLoggedUser.execute()
      .flatMap { [unowned self] sender in
        guard let channel = channel else {
          let conversation = ConversationChannel(id: UUID(), users: [sender, receiver])

          return Single.zip(
            conversationRepository
              .addConversation(conversation)
              .andThen(Single.just(conversation)),
            Single.just(sender))
        }

        return Single.zip(
          Single.just(channel),
          Single.just(sender))
      }
      .flatMapCompletable { [unowned self] (conversationChannel, sender) in
        let message = Message(
          channelId: conversationChannel.id,
          id: UUID(),
          content: content,
          sender: sender,
          receiver: receiver)

        return conversationRepository.sendMessage(message)
      }
  }
}
