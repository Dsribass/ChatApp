//
//  IAuthRepository.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 12/01/23.
//

import RxSwift

public protocol AuthRepository {
  func userAuthChanges() -> Observable<UserState>
  func signIn(withEmail email: String, andPassword password: String) -> Single<String>
  func signUp(withEmail email: String, andPassword password: String) -> Single<String>
  func getLoggedUserId() -> Single<String>
}
