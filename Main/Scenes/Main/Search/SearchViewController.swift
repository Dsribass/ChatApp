//
//  SearchViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 03/02/23.
//

import UIKit

class SearchViewController: SceneViewController<SearchView> {
  override func setupLayout() {
    super.setupLayout()
    title = SearchView.title
  }

  override func additionalConfigurations() {
    super.additionalConfigurations()
    contentView.usersTableView.delegate = self
    contentView.usersTableView.dataSource = self
  }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = contentView.usersTableView.dequeueReusableCell(withIdentifier: SearchView.userCellIdentifier)!
    var config = UIListContentConfiguration.cell()
    config.text = "Usuario \(indexPath.row)"
    cell.contentConfiguration = config
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    contentView.usersTableView.deselectRow(at: indexPath, animated: true)
  }
}
