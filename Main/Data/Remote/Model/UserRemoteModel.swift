//
//  UserRemoteModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/05/23.
//

import Foundation
import Domain

// MARK: - Model
struct UserRemoteModel: Codable {
  let id: String
  let name: String
  let email: String
  let photoUrl: String
}

// MARK: - Json Methods
extension UserRemoteModel {
  func toJson() throws -> Any  {
    do {
      let encoder = JSONEncoder()
      return try JSONSerialization.jsonObject(with: encoder.encode(self))
    } catch {
      throw DataError.serialization
    }
  }

  static func fromJson(_ json: [String: Any]) throws -> UserRemoteModel {
    do {
      let decoder = JSONDecoder()
      let data = try JSONSerialization.data(withJSONObject: json)
      return try decoder.decode(UserRemoteModel.self, from: data)
    } catch {
      throw DataError.deserialization
    }
  }
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
