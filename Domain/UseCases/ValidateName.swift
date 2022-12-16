//
//  ValidateName.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 15/12/22.
//

import Foundation

public protocol ValidateNameUseCase {
  func execute(name: String) -> ValidationResult
}

public class ValidateName: ValidateNameUseCase {
  public init() {}

  public func execute(name: String) -> ValidationResult {
    if name.isEmpty {
      return .empty
    }

    return .valid
  }
}
