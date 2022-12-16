//
//  ValidatePassword.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 15/12/22.
//

public protocol ValidatePasswordUseCase {
  func execute(password: String) -> ValidationResult
}

public class ValidatePassword: ValidatePasswordUseCase {
  public init() {}

  public func execute(password: String) -> ValidationResult {
    if password.isEmpty {
      return .empty
    }

    if password.count < 8 {
      return .invalidLength
    }

    return .valid
  }
}
