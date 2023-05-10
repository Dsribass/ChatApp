//
//  ConversationRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol ConversationRepository {
  func addConversation(_ conversation: ConversationChannel) -> Completable
  func getConversations(from user: User) -> Observable<[ConversationChannel]>
  func sendMessage(_ message: Message) -> Completable
}
