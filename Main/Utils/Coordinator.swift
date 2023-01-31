//
//  Coordinator.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 14/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
  var navigationController: UINavigationController { get set }
  func start()
}
