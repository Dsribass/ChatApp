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
  func signIn(withEmail email: String, andPassword password: String) -> Completable {
    Completable.create { completable in
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if let error = error {
          completable(.error(error))
        }

        completable(.completed)
      }

      return Disposables.create()
    }
  }

  func signUp(withEmail email: String, andPassword password: String) -> Completable {
    Completable.create { completable in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          completable(.error(error))
        }

        completable(.completed)
      }

      return Disposables.create()
    }
  }
}
