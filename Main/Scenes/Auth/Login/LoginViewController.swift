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
        contentView.errorMessage.text = ""
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

    viewModel.onLoginAction
      .bind { [unowned self] action in
        switch action {
        case .loginSuccess:
          print("Sucesso")
        case .loginFailed:
          contentView.errorMessage.text = "Email ou senha incorretos!"
        case .loginError:
          contentView.errorMessage.text = "Desculpe, ocorreu algum erro. Tente novamente"
        }
      }
      .disposed(by: bag)
  }
}

protocol LoginViewRouter {
  func navigateToSignUpPage()
}
