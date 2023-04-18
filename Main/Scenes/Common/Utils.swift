//
//  Utils.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 05/01/23.
//

import UIKit
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

extension UIButton {
  func shakeButton() {
    let shakeAnimation = CAKeyframeAnimation(keyPath: "position.x")
    shakeAnimation.values = [0,10,-10,10,0]
    shakeAnimation.keyTimes = [0,0.16,0.5,0.83,1]
    shakeAnimation.duration = 0.4
    shakeAnimation.isAdditive = true

    self.layer.add(shakeAnimation, forKey: "shake")
  }
}
