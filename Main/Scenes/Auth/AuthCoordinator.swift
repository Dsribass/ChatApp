//
//  AuthCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit
import Domain

class AuthCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewModel = LoginViewModel(
      validateEmail: ValidateEmailAddress(),
      validatePassword: ValidatePassword())

    navigationController.pushViewController(
      LoginViewController(
        router: self,
        viewModel: viewModel),
      animated: false)
  }
}

extension AuthCoordinator: LoginViewRouter {
  func navigateToSignUpPage() {
    navigationController.pushViewController(SignUpViewController(), animated: true)
  }
}
