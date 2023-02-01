//
//  SignUpViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 13/12/22.
//

import UIKit

class SignUpViewController: SceneViewController<SignUpView> {
  private let viewModel: SignUpViewModel

  init(viewModel: SignUpViewModel) {
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

  func setupObservables() {
    viewModel.onNameStatus
      .bind { [unowned self] status in
        contentView.nameTextField.status = status.toTextFieldStatus()
      }
      .disposed(by: bag)

    viewModel.onEmailStatus
      .bind { [unowned self] status in
        contentView.emailTextField.status = status.toTextFieldStatus()
      }
      .disposed(by: bag)

    viewModel.onPasswordStatus
      .bind { [unowned self] status in
        contentView.passwordTextField.status = status.toTextFieldStatus()
      }
      .disposed(by: bag)

    contentView.registerButton.rx.tap
      .map { [unowned self] _ in
        return (
          name: contentView.nameTextField.textField.text ?? "",
          email: contentView.emailTextField.textField.text ?? "",
          password: contentView.passwordTextField.textField.text ?? "")
      }
      .bind { [unowned self] name, email, password in
        viewModel.register(withName: name, email: email, andPassword: password)
      }
      .disposed(by: bag)

    viewModel.onSignUpError
      .bind { [unowned self] in
        contentView.errorMessage.text = "Erro ao se registrar. Tente Novamente."
      }
      .disposed(by: bag)
  }
}
