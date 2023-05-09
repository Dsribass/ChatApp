//
//  DataError.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 03/05/23.
//

import Foundation

enum DataError: Error {
  case itemNotFound
  case serialization
  case deserialization
  case databaseError
  case unexpected
}
