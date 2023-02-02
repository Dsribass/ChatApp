//
//  ConversationsView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit
import SnapKit

class ConversationsView: UIViewCodable {
  static let title = "Chat"
  static let cellIdentifier = "chatCell"

  lazy var conversations: UITableView = {
    let table = UITableView()
    table.register(
      UITableViewCell.self,
      forCellReuseIdentifier: ConversationsView.cellIdentifier)

    return table
  }()

  override func setupLayout() {
    super.setupLayout()
    backgroundColor = .systemBackground
  }

  override func setupSubviews() {
    super.setupSubviews()
    addSubview(conversations)
  }

  override func setupConstraints() {
    super.setupConstraints()

    conversations.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
}
