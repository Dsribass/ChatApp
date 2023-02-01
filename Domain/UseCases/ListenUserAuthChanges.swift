//
//  ListenUserAuthChanges.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 17/01/23.
//

import RxSwift
import Foundation

public protocol ListenUserAuthChangesUseCase {
  func execute() -> Observable<UserState>
}

public class ListenUserAuthChanges: ListenUserAuthChangesUseCase {
  private let repository: AuthRepository

  public init(repository: AuthRepository) {
    self.repository = repository
  }

  public func execute() -> Observable<UserState> {
    repository.userAuthChanges()
  }
}
