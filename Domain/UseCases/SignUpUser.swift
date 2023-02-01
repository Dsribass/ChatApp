//
//  SignUpUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 12/01/23.
//

import RxSwift

public protocol SignUpUserUseCase {
  func execute(withName name: String, email: String, andPassword password: String) -> Completable
}

public class SignUpUser: SignUpUserUseCase {
  private let repository: AuthRepository

  public init(repository: AuthRepository) {
    self.repository = repository
  }

  public func execute(
    withName name: String,
    email: String,
    andPassword password: String
  ) -> Completable {
    repository
      .signUp(withEmail: email, andPassword: password)
      .andThen(repository.saveUserName(name))
  }
}
