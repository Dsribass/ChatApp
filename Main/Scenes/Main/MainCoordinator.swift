//
//  MainCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit

class MainCoordinator: Coordinator {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    navigationController.setViewControllers(
      [ConversationsViewController(router: self)],
      animated: true)
  }
}

extension MainCoordinator: ConversationsViewRouter {
  func navigateToSearchView() {
    let searchViewController = UINavigationController(rootViewController: SearchViewController())
    searchViewController.modalPresentationStyle = .pageSheet
    if let sheet = searchViewController.sheetPresentationController {
      sheet.detents = [.large()]
    }

    navigationController.viewControllers[0].present(searchViewController, animated: true)
  }

  func navigateToProfileView() {
    let profileVC = UINavigationController(rootViewController: ProfileViewController())
    profileVC.modalPresentationStyle = .pageSheet
    if let sheet = profileVC.sheetPresentationController {
      sheet.detents = [.large()]
    }

    navigationController.viewControllers[0].present(profileVC, animated: true)
  }
}
