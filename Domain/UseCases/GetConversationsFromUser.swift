//
//  GetConversationsFromUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol GetConversationsFromUserUseCase {
  func execute(userId: String) -> Observable<[Conversation]>
}

public class GetConversationsFromUser: GetConversationsFromUserUseCase {
  private let repository: ConversationRepository

  init(repository: ConversationRepository) {
    self.repository = repository
  }

  public func execute(userId: String) -> Observable<[Conversation]> {
    repository.getConversations(from: userId)
  }
}
