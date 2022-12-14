//
//  LoginViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: SceneViewController<LoginView> {
  private let router: LoginViewRouter

  init(router: LoginViewRouter) {
    self.router = router
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupObservables()
  }

  func setupObservables() {
    contentView.registerButton.rx.tap
      .bind { [unowned self] _ in  router.navigateToSignUpPage() }
      .disposed(by: bag)
  }
}

protocol LoginViewRouter {
  func navigateToSignUpPage()
}
