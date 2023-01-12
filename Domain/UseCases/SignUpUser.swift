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
  public init() {}

  public func execute(
    withName name: String,
    email: String,
    andPassword password: String
  ) -> Completable {
    Completable.empty()
  }
}
