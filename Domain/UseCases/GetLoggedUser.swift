//
//  GetLoggedUser.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 10/05/23.
//

import RxSwift

public protocol GetLoggedUserUseCase {
  func execute() -> Single<User>
}

public class GetLoggedUser: GetLoggedUserUseCase {
  private let authRepository: AuthRepository
  private let userRepository: UserRepository

  public init(authRepository: AuthRepository, userRepository: UserRepository) {
    self.authRepository = authRepository
    self.userRepository = userRepository
  }

  public func execute() -> Single<User> {
    authRepository
      .getLoggedUserId()
      .flatMap { [unowned self] id in userRepository.getUser(byId: id) }
  }
}
