//
//  SearchView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 03/02/23.
//

import UIKit
import SnapKit

class SearchView: UIViewCodable {
  static let title = "Nova Conversa"
  static let userCellIdentifier = "userCell"

  private lazy var contentView = UIView()

  lazy var searchField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .tertiarySystemBackground
    textField.borderStyle = .roundedRect
    textField.clearButtonMode = .always
    return textField
  }()

  lazy var usersTableView: UITableView = {
    let table = UITableView()
    table.backgroundColor = .secondarySystemBackground
    table.separatorStyle = .none
    table.register(
      UITableViewCell.self,
      forCellReuseIdentifier: SearchView.userCellIdentifier)
    return table
  }()

  override func setupLayout() {
    super.setupLayout()
    backgroundColor = .secondarySystemBackground
  }

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(contentView)
    contentView.addSubview(searchField)
    contentView.addSubview(usersTableView)
  }

  override func setupConstraints() {
    super.setupConstraints()

    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    searchField.snp.makeConstraints { make in
      make.top.equalTo(contentView).offset(62)
      make.leading.equalTo(contentView).offset(16)
      make.trailing.equalTo(contentView).offset(-16)
    }

    usersTableView.snp.makeConstraints { make in
      make.top.equalTo(searchField.snp.bottom).offset(24)
      make.leading.equalTo(contentView)
      make.trailing.equalTo(contentView)
      make.bottom.equalTo(contentView)
    }
  }
}
