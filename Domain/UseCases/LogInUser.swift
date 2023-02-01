//
//  LogInUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 12/01/23.
//

import RxSwift

public protocol LogInUserUseCase {
  func execute(withEmail email: String, andPassword password: String) -> Completable
}

public class LogInUser: LogInUserUseCase {
  private let repository: AuthRepository

  public init(repository: AuthRepository) {
    self.repository = repository
  }

  public func execute(
    withEmail email: String,
    andPassword password: String
  ) -> Completable {
    repository.signIn(withEmail: email, andPassword: password)
  }
}
