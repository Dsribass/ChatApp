//
//  LoginView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import UIKit
import SnapKit

class LoginView: UIViewCodable {
  lazy var scrollView = UIScrollView()
  lazy var contentView = UIView()

  lazy var logo: UIImageView = {
    let imgView = UIImageView(image: UIImage(systemName: "message"))
    return imgView
  }()

  lazy var title: UILabel = {
    let title = UILabel()
    title.text = "ChatApp"
    title.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    return title
  }()

  lazy var form: UIStackView = {
    let stack = UIStackView()
    stack.spacing = 8
    stack.axis = .vertical
    return stack
  }()

  lazy var userTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Usuario"
    return container
  }()

  lazy var passwordTextField: TextFieldContainer = {
    let container = TextFieldContainer()
    container.label.text = "Senha"
    return container
  }()

  lazy var loginButton: UIButton = {
    let button = UIButton(configuration: .filled(),primaryAction: .none)
    button.setTitle("Logar", for: .normal)
    return button
  }()

  lazy var registerButton: UIButton = {
    let button = UIButton(configuration: .plain(),primaryAction: .none)
    button.setTitle("Criar conta", for: .normal)
    return button
  }()

  override func setupLayout() {
    super.setupLayout()
    backgroundColor = .secondarySystemBackground
  }

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(scrollView)
    scrollView.addSubview(contentView)

    contentView.addSubview(logo)
    contentView.addSubview(title)
    contentView.addSubview(form)

    form.addArrangedSubview(userTextField)
    form.addArrangedSubview(passwordTextField)

    contentView.addSubview(loginButton)
    contentView.addSubview(registerButton)
  }

  override func setupConstraints() {
    super.setupConstraints()

    scrollView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }

    contentView.snp.makeConstraints { make in
      make.centerY.equalTo(self)
      make.leading.equalTo(self).inset(24)
      make.trailing.equalTo(self).inset(24)
    }

    logo.snp.makeConstraints { make in
      make.width.height.equalTo(96)
      make.centerX.equalTo(contentView)
      make.top.equalTo(contentView)
    }

    title.snp.makeConstraints { make in
      make.top.equalTo(logo.snp.bottom).offset(12)
      make.centerX.equalTo(contentView)
    }

    form.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(48)
      make.leading.equalTo(contentView)
      make.trailing.equalTo(contentView)
    }

    loginButton.snp.makeConstraints { make in
      make.top.equalTo(form.snp.bottom).offset(32)
      make.leading.equalTo(contentView)
      make.trailing.equalTo(contentView)
    }

    registerButton.snp.makeConstraints { make in
      make.top.equalTo(loginButton.snp.bottom).offset(24)
      make.leading.equalTo(contentView)
      make.trailing.equalTo(contentView)
      make.bottom.equalTo(contentView)
    }
  }

  override func additionalConfigurations() {
    super.additionalConfigurations()
  }
}
