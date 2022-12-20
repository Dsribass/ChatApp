//
//  TextFieldContainer.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 13/12/22.
//

import UIKit
import SnapKit

class TextFieldContainer: UIViewCodable {
  enum Status {
    case valid, empty, invalid
  }

  var status: Status = .valid {
    didSet {
      guard status != .valid else {
        textField.layer.borderColor = .none
        textField.layer.borderWidth = 0
        errorMessage.text = ""
        return
      }

      textField.layer.borderColor = UIColor.systemRed.cgColor
      textField.layer.borderWidth = 1
      textField.layer.cornerRadius = 4
      if status == .empty {
        errorMessage.text = "Campo vazio!"
      } else if status == .invalid {
        errorMessage.text = "Campo invalido!"
      }
    }
  }

  lazy var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .body)
    return label
  }()

  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    return textField
  }()

  lazy var errorMessage: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    label.textColor = .systemRed
    return label
  }()

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(label)
    addSubview(textField)
    addSubview(errorMessage)
  }

  override func setupConstraints() {
    super.setupConstraints()

    label.snp.makeConstraints { make in
      make.top.equalTo(self)
      make.leading.equalTo(self)
      make.trailing.equalTo(self)
    }

    textField.snp.makeConstraints { make in
      make.top.equalTo(label.snp.bottom).offset(4)
      make.leading.equalTo(self)
      make.trailing.equalTo(self)
    }

    errorMessage.snp.makeConstraints { make in
      make.top.equalTo(textField.snp.bottom).offset(4)
      make.leading.equalTo(self).offset(8)
      make.trailing.equalTo(self)
      make.bottom.equalTo(self)
    }
  }
}
