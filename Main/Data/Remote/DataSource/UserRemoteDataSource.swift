//
//  UserRemoteDataSource.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/05/23.
//

import Foundation
import RxSwift
import FirebaseDatabase

class UserRemoteDataSource {
  private lazy var userDatabase: DatabaseReference? = {
    Database.database()
      .reference()
      .child("users")
  }()

  func saveUser(_ user: UserRemoteModel) -> Completable {
    Completable.create { [weak self] completer in
      guard let self = self, let userDatabase = self.userDatabase else {
        completer(.error(DataError.unexpected))
        return Disposables.create()
      }

      do {
        let userJson = try user.toJson()
        userDatabase
          .child(user.id)
          .setValue(userJson)

        completer(.completed)
      } catch {
        completer(.error(error))
      }

      return Disposables.create()
    }
  }

  func getUser(id: String) -> Single<UserRemoteModel> {
    Single.create { [weak self] observer in
      guard let self = self, let userDatabase = self.userDatabase else {
        observer(.failure(DataError.unexpected))
        return Disposables.create()
      }

      userDatabase.getData { error, snapshot in
        guard error == nil else {
          observer(.failure(DataError.unexpected))
          return
        }

        guard let json = snapshot?.value(forKey: id) as? [String: Any] else {
          observer(.failure(DataError.deserialization))
          return
        }

        guard let user = try? UserRemoteModel.fromJson(json) else {
          observer(.failure(DataError.deserialization))
          return
        }

        observer(.success(user))
      }

      return Disposables.create()
    }
  }
}
