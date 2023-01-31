//
//  AppCoordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit
import Domain
import RxSwift

class AppCoordinator: Coordinator {
  var navigationController: UINavigationController
  let listenUserAuthChanges: ListenUserAuthChangesUseCase
  private let bag = DisposeBag()

  init(
    navigationController: UINavigationController,
    listenUserAuthChanges: ListenUserAuthChangesUseCase
  ) {
    self.navigationController = navigationController
    self.listenUserAuthChanges = listenUserAuthChanges
  }

  func start() {
    listenUserAuthChanges.execute()
      .subscribe { [weak self] state in
        switch state {
        case .loggedIn:
          self?.showChatFlow()
        case .loggedOut:
          self?.showAuthFlow()
        }
      } onError: { [weak self] error in
        self?.showAuthFlow()
      }
      .disposed(by: bag)
  }

  private func showAuthFlow() {
    let coordinator = AuthCoordinator(navigationController: navigationController)
    coordinator.start()
  }

  private func showChatFlow() {
    let coordinator = ChatCoordinator(navigationController: navigationController)
    coordinator.start()
  }
}
