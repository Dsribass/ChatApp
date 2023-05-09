//
//  UserRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol UserRepository {
  func saveUser(_ user: User) -> Completable
  func getUser(byId id: String) -> Single<User>
}
