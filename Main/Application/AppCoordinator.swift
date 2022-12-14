//
//  AppCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit

class AppCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let coordinator = AuthCoordinator(navigationController: navigationController)
    addDependency(coordinator)
    coordinator.start()
  }
}
