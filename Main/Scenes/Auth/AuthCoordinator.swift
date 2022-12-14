//
//  AuthCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit

class AuthCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    navigationController.pushViewController(LoginViewController(router: self), animated: false)
  }
}

extension AuthCoordinator: LoginViewRouter {
  func navigateToSignUpPage() {
    navigationController.pushViewController(SignUpViewController(), animated: true)
  }
}
