//
//  User.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 28/02/23.
//

public struct User {
  public let id: String
  public let name: String
  public let email: String
  public let photoUrl: String

  public init(id: String, name: String, email: String, photoUrl: String) {
    self.id = id
    self.name = name
    self.email = email
    self.photoUrl = photoUrl
  }
}
