//
//  GetUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol GetUserUseCase {
  func execute(userId: String) -> Single<User>
}

public class GetUser: GetUserInformationUseCase {
  private let repository: UserRepository

  public init(repository: UserRepository) {
    self.repository = repository
  }

  public func execute(userId: String) -> Single<User> {
    repository.getUser(byId: userId)
  }
}
