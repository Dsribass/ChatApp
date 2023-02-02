//
//  ConversationsViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 31/01/23.
//

import UIKit

class ConversationsViewController: SceneViewController<ConversationsView> {
  override func setupLayout() {
    super.setupLayout()
    title = ConversationsView.title
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: .none, action: .none)
  }
}
