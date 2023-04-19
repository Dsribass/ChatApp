//
//  UserRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol UserRepository {
  func getUser() -> Single<User>
}
