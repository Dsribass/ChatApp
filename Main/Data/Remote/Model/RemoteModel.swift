//
//  RemoteModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 10/05/23.
//

import Foundation

protocol RemoteModel: Codable {
  func toJson() throws -> Any

  static func fromJson(_ json: [String: Any]) throws -> Self
}

extension RemoteModel {
  func toJson() throws -> Any {
    do {
      let encoder = JSONEncoder()
      return try JSONSerialization.jsonObject(with: encoder.encode(self))
    } catch {
      throw DataError.serialization
    }
  }

  static func fromJson(_ json: [String: Any]) throws -> Self  {
    do {
      let decoder = JSONDecoder()
      let data = try JSONSerialization.data(withJSONObject: json)
      return try decoder.decode(Self.self, from: data)
    } catch {
      throw DataError.deserialization
    }
  }
}
