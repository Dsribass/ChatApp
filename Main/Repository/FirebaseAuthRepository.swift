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

  func userAuthChanges() -> Observable<UserState> {
    Observable.create { observer in
      Auth.auth().addStateDidChangeListener { _, user in
        observer.onNext(user != nil ? .loggedIn : .loggedOut)
      }
      return Disposables.create()
    }
  }

  func saveUserName(_ name: String) -> Completable {
    Completable.create { completable in
      let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
      changeRequest?.displayName = name
      changeRequest?.commitChanges { error in
        if let error = error { completable(.error(error)) }

        completable(.completed)
      }

      return Disposables.create()
    }
  }
}
