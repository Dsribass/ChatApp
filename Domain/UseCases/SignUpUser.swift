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
  private let authRepository: AuthRepository
  private let userRepository: UserRepository

  public init(authRepository: AuthRepository, userRepository: UserRepository) {
    self.authRepository = authRepository
    self.userRepository = userRepository
  }

  public func execute(
    withName name: String,
    email: String,
    andPassword password: String
  ) -> Completable {
    authRepository
      .signUp(withEmail: email, andPassword: password)
      .flatMapCompletable { [unowned self] id in
        self.userRepository.saveUser(User(id: id, name: name, email: email, photoUrl: ""))
      }
  }
}
