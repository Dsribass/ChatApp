//
//  GetUserConversations.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol GetUserConversationsUseCase {
  func execute(userId: String) -> Observable<[ConversationChannel]>
}

public class GetUserConversations: GetUserConversationsUseCase {
  private let conversationRepository: ConversationRepository
  private let userRepository: UserRepository

  public init(conversationRepository: ConversationRepository, userRepository: UserRepository) {
    self.conversationRepository = conversationRepository
    self.userRepository = userRepository
  }

  public func execute(userId: String) -> Observable<[ConversationChannel]> {
    userRepository.getUser(byId: userId)
      .asObservable()
      .concatMap { [unowned self] user in
        conversationRepository.getConversations(from: user)
      }
  }
}
