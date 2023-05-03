//
//  ConversationRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol ConversationRepository {
  func getConversations(from user: User) -> Observable<[ConversationChannel]>
  func getConversationChannel(byId id: Int) -> Single<ConversationChannel>
  func sendMessage(_ message: Message, to user: User) -> Completable
}
