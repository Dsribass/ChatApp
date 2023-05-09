//
//  BaseUserRepository.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 05/05/23.
//

import Domain
import RxSwift

class BaseUserRepository: UserRepository {
  private let remoteDS: UserRemoteDataSource

  init(userRemoteDS: UserRemoteDataSource) {
    self.remoteDS = userRemoteDS
  }

  func saveUser(_ user: User) -> Completable {
    remoteDS.saveUser(UserRemoteModel(from: user))
  }
  func getUser(byId id: String) -> Single<User> {
    remoteDS.getUser(id: id).map { $0.toUserDomain() }
  }
}
