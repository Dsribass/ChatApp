//
//  UserRemoteModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/05/23.
//

import Foundation
import Domain

// MARK: - Model
struct UserRemoteModel: RemoteModel {
  let id: String
  let name: String
  let email: String
  let photoUrl: String
}

// MARK: - Mappers
extension UserRemoteModel {
  init(from user: User) {
    self.init(id: user.id, name: user.name, email: user.email, photoUrl: user.photoUrl)
  }

  func toUserDomain() -> User {
    User(id: id, name: name, email: email, photoUrl: photoUrl)
  }
}
