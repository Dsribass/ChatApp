//
//  ChatCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit

class ChatCoordinator: Coordinator {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    navigationController.setViewControllers([ChatListViewController()], animated: true)
  }
}
