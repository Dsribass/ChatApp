//
//  UserRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol UserRepository {
  func saveUser(_ user: User) -> Completable
  func getUser(byEmail: String) -> Single<User>
  func getUser(byId: String) -> Single<User>
}
