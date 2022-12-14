//
//  Coordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  func start()
}

extension Coordinator {
  func addDependency(_ coordinator: Coordinator) {
    for element in childCoordinators {
      if element === coordinator { return }
    }
    childCoordinators.append(coordinator)
  }

  func removeDependency(_ coordinator: Coordinator?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

    for (index, element) in childCoordinators.enumerated() {
      if element === coordinator {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
}
