//
//  Utils.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 05/01/23.
//

import Foundation
import Domain

extension ValidationResult {
  func toTextFieldStatus() -> TextFieldContainer.Status {
    switch self {
    case .valid: return .valid
    case .empty: return .empty
    case .invalid: return .invalid
    case .invalidLength: return .invalid
    }
  }
}
