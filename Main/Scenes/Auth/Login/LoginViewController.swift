//
//  LoginViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import UIKit
import RxSwift
import RxCocoa
import Domain

class LoginViewController: SceneViewController<LoginView> {
  private let router: LoginViewRouter
  private let viewModel: LoginViewModel

  init(router: LoginViewRouter, viewModel: LoginViewModel) {
    self.router = router
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupObservables()
  }

  private func setupObservables() {
    contentView.loginButton.rx.tap
      .map { [unowned self] _ in
        return (
          email: contentView.emailTextFieldContainer.textField.text ?? "",
          password: contentView.passwordTextFieldContainer.textField.text ?? "")
      }
      .bind { [unowned self] email, password in
        viewModel.login(withEmail: email, andPassword: password)
      }
      .disposed(by: bag)

    contentView.registerButton.rx.tap
      .bind { [unowned self] _ in  router.navigateToSignUpPage() }
      .disposed(by: bag)

    viewModel.onEmailStatus
      .bind { [unowned self] status in
        contentView.emailTextFieldContainer.status = status.toTextFieldStatus()
      }
      .disposed(by: bag)

    viewModel.onPasswordStatus
      .bind { [unowned self] status in
        contentView.passwordTextFieldContainer.status = status.toTextFieldStatus()
      }
      .disposed(by: bag)
  }
}

protocol LoginViewRouter {
  func navigateToSignUpPage()
}

private extension ValidationResult {
  func toTextFieldStatus() -> TextFieldContainer.Status {
    switch self {
    case .valid: return .valid
    case .empty: return .empty
    case .invalid: return .invalid
    case .invalidLength: return .invalid
    }
  }
}
