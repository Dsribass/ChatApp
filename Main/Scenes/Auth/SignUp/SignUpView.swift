//
//  SignUpView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 13/12/22.
//

import UIKit
import SnapKit

class SignUpView: UIViewCodable {
  lazy var title: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    label.text = "Cadastro"
    return label
  }()

  lazy var form: UIStackView = {
    let stack = UIStackView()
    stack.spacing = 8
    stack.axis = .vertical
    return stack
  }()

  lazy var nameTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Nome"
    container.textField.keyboardType = .default
    return container
  }()

  lazy var emailTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Email"
    container.textField.keyboardType = .emailAddress
    return container
  }()

  lazy var passwordTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Senha"
    container.textField.keyboardType = .default
    container.textField.isSecureTextEntry = true
    return container
  }()

  lazy var confirmPasswordTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Confirmar Senha"
    container.textField.keyboardType = .default
    container.textField.isSecureTextEntry = true
    return container
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton(configuration: .filled(),primaryAction: .none)
    button.setTitle("Cadastrar", for: .normal)
    return button
  }()

  override func setupLayout() {
    super.setupLayout()
    backgroundColor = .secondarySystemBackground
  }

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(title)

    addSubview(form)
    form.addArrangedSubview(nameTextField)
    form.addArrangedSubview(emailTextField)
    form.addArrangedSubview(passwordTextField)
    form.addArrangedSubview(confirmPasswordTextField)

    addSubview(registerButton)
  }

  override func setupConstraints() {
    super.setupConstraints()

    title.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(48)
      make.leading.equalTo(self).offset(24)
      make.trailing.equalTo(self).offset(-24)
    }

    form.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(32)
      make.leading.equalTo(self).offset(24)
      make.trailing.equalTo(self).offset(-24)
    }

    registerButton.snp.makeConstraints { make in
      make.top.equalTo(form.snp.bottom).offset(24)
      make.leading.equalTo(self).offset(24)
      make.trailing.equalTo(self).offset(-24)
    }
  }
}
