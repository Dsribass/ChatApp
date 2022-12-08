//
//  View.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import Foundation

class MainView: UIViewCodable {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBlue
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
