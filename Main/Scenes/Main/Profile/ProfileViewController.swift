//
//  ProfileViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 16/06/23.
//

import UIKit

class ProfileViewController: SceneViewController<ProfileView> {
  override func setupLayout() {
    super.setupLayout()
    title = ProfileView.title
  }

  override func additionalConfigurations() {
    super.additionalConfigurations()
    contentView.profileTableView.delegate = self
    contentView.profileTableView.dataSource = self
  }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = contentView.profileTableView.dequeueReusableCell(withIdentifier: ProfileView.profileCellIdentifier)!
    var config = UIListContentConfiguration.cell()
    config.text = "Usuario \(indexPath.row)"
    cell.backgroundColor = .systemBackground
    cell.contentConfiguration = config
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    contentView.profileTableView.deselectRow(at: indexPath, animated: true)
  }
}
