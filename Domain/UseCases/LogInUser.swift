//
//  LogInUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 12/01/23.
//

import RxSwift

public protocol LogInUserUseCase {
  func execute(withEmail email: String, andPassword password: String) -> Single<LogInResult>
}

public class LogInUser: LogInUserUseCase {
  public init() {}

  public func execute(
    withEmail email: String,
    andPassword password: String
  ) -> Single<LogInResult> {
    let emailMock = "test@test.com"
    let passwordMock = "12345678"


    if emailMock == email && passwordMock == password {
      return Single.just(.success)
    }

    return Single.just(.incorrect)
  }
}

public enum LogInResult {
  case success, incorrect
}
