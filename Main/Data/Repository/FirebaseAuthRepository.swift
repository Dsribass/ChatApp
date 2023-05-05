//
//  FirebaseAuthRepository.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 12/01/23.
//

import RxSwift
import Domain
import FirebaseAuth

class FirebaseAuthRepository: AuthRepository {
  func getLoggedUserId() -> Single<String> {
    let user = Auth.auth().currentUser

    guard let user = user else {
      return Single.error(ApplicationErrors.itemNotFound)
    }

    return Single.just(user.uid)
  }

  func signIn(withEmail email: String, andPassword password: String) -> Single<String> {
    Single.create { completable in
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if let error = error {
          return completable(.failure(error))
        }

        guard let result = result else {
          return completable(.failure(ApplicationErrors.itemNotFound))
        }

        completable(.success(result.user.uid))
      }

      return Disposables.create()
    }
  }

  func signUp(withEmail email: String, andPassword password: String) -> Single<String> {
    Single.create { completable in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          return completable(.failure(error))
        }

        guard let result = result else {
          return completable(.failure(ApplicationErrors.itemNotFound))
        }

        completable(.success(result.user.uid))
      }

      return Disposables.create()
    }
  }

  func userAuthChanges() -> Observable<UserState> {
    Observable.create { observer in
      Auth.auth().addStateDidChangeListener { _, user in
        observer.onNext(user != nil ? .loggedIn : .loggedOut)
      }
      return Disposables.create()
    }
  }
}
