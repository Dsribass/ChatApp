//
//  ConversationsViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit

class ConversationsViewController: SceneViewController<ConversationsView> {
  private let router: ConversationsViewRouter

  init(router: ConversationsViewRouter) {
    self.router = router
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    contentView.addNewChatButton.rx.tap
      .bind { [weak self] in self?.router.navigateToSearchView() }
      .disposed(by: bag)

    contentView.accountButton.rx.tap
      .bind { [weak self] in self?.router.navigateToProfileView() }
      .disposed(by: bag)
  }

  override func setupLayout() {
    super.setupLayout()
    title = ConversationsView.title
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItems = [
      contentView.accountButton,
      contentView.addNewChatButton]
  }

  override func additionalConfigurations() {
    super.additionalConfigurations()
    contentView.conversations.delegate = self
    contentView.conversations.dataSource = self
  }
}

extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = contentView.conversations.dequeueReusableCell(withIdentifier: ConversationsView.cellIdentifier)!
    var config = UIListContentConfiguration.cell()
    config.text = "Usuario \(indexPath.row)"
    cell.backgroundColor = .secondarySystemBackground
    cell.accessoryType = .disclosureIndicator
    cell.contentConfiguration = config
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    contentView.conversations.deselectRow(at: indexPath, animated: true)
  }
}

protocol ConversationsViewRouter {
  func navigateToSearchView()
  func navigateToProfileView()
}
