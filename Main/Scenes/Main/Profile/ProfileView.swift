//
//  ProfileView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 16/06/23.
//

import UIKit
import SnapKit

class ProfileView: UIViewCodable {
  static let title = "Perfil"
  static let profileCellIdentifier = "profileCellIdentifier"

  private lazy var contentView = UIView()

  lazy var profileTableView: UITableView = {
    let table = UITableView()
    table.backgroundColor = .secondarySystemBackground
    table.register(
      UITableViewCell.self,
      forCellReuseIdentifier: ProfileView.profileCellIdentifier)
    return table
  }()

  override func setupLayout() {
    super.setupLayout()
    backgroundColor = .secondarySystemBackground
  }

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(contentView)
    contentView.addSubview(profileTableView)
  }

  override func setupConstraints() {
    super.setupConstraints()

    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    profileTableView.snp.makeConstraints { make in
      make.top.equalTo(contentView).offset(24)
      make.leading.equalTo(contentView)
      make.trailing.equalTo(contentView)
      make.bottom.equalTo(contentView)
    }
  }
}
