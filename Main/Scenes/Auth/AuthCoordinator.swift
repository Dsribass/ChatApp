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
    navigationController.setViewControllers(
      [LoginViewController(
        router: self,
        viewModel: Factory.makeLogInViewModel()
      )],animated: true)
  }
}

extension AuthCoordinator: LoginViewRouter {
  func navigateToSignUpPage() {
    navigationController.pushViewController(
      SignUpViewController(viewModel: Factory.makeSignUpViewModel()),
      animated: true)
  }
}
