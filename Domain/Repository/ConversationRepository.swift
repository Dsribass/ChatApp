//
//  ConversationRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol ConversationRepository {
  func getConversations(from userId: String) -> Observable<[Conversation]>
}
