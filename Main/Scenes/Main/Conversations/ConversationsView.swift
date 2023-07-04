//
//  ConversationsView.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit
import SnapKit

class ConversationsView: UIViewCodable {
  static let title = "Conversas"
  static let cellIdentifier = "chatCell"

  lazy var addNewChatButton: UIBarButtonItem = {
    UIBarButtonItem(
      image: UIImage(systemName: "square.and.pencil"),
      style: .plain,
      target: .none,
      action: .none)
  }()

  lazy var accountButton: UIBarButtonItem = {
    UIBarButtonItem(
      image: UIImage(systemName: "person.crop.circle.fill"),
      style: .plain,
      target: .none,
      action: .none)
  }()

  lazy var conversations: UITableView = {
    let table = UITableView()
    table.register(
      UITableViewCell.self,
      forCellReuseIdentifier: ConversationsView.cellIdentifier)

    return table
  }()

  override func setupLayout() {
    super.setupLayout()
    conversations.backgroundColor = .secondarySystemBackground
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
