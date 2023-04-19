//
//  GetUserInformation.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol GetUserInformationUseCase {
  func execute() -> Single<User>
}

public class GetUserInformation: GetUserInformationUseCase {
  private let repository: UserRepository

  init(repository: UserRepository) {
    self.repository = repository
  }

  public func execute() -> Single<User> { repository.getUser() }
}
