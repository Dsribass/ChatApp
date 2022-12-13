//
//  TextFieldContainer.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 13/12/22.
//

import UIKit
import SnapKit

class TextFieldContainer: UIViewCodable {
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

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(label)
    addSubview(textField)
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
      make.bottom.equalTo(self)
    }
  }
}
