//
//  ValidateEmailAddress.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import Foundation

public protocol ValidateEmailAddressUseCase {
  func execute(email: String) -> InputValidationResult
}

public class ValidateEmailAddress: ValidateEmailAddressUseCase {
  public func execute(email: String) -> InputValidationResult {
    if email.isEmpty {
      return .empty
    }

    let emailRegex = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
    + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

    let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)

    return predicate.evaluate(with: email) ? .valid : .invalid
  }
}

public enum InputValidationResult {
  case valid, empty, invalid
}
