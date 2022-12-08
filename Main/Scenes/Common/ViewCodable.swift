//
//  ViewCodable.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//


import UIKit

protocol ViewCodable {
  func setupView()
  func setupLayout()
  func setupSubviews()
  func setupConstraints()
  func additionalConfigurations()
}

extension ViewCodable {
  func setupView()  {
    setupLayout()
    setupSubviews()
    setupConstraints()
    additionalConfigurations()
  }
}
