//
//  GetUserInformation.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 19/04/23.
//

import RxSwift

public protocol GetUserInformationUseCase {
  func execute(userId: String) -> Single<User>
  func execute(userEmail: String) -> Single<User>
}

public class GetUserInformation: GetUserInformationUseCase {
  private let repository: UserRepository

  public init(repository: UserRepository) {
    self.repository = repository
  }

  public func execute(userId: String) -> Single<User> {
    repository.getUser(byId: userId)
  }

  public func execute(userEmail: String) -> Single<User> {
    repository.getUser(byEmail: userEmail)
  }
}
