//
//  Factory.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 26/01/23.
//

import Foundation
import Domain

enum Factory {
  // MARK: DataSources
  static func makeUserRemoteDS() -> UserRemoteDataSource {
    UserRemoteDataSource()
  }

  // MARK: Repositories
  static func makeAuthRepository() -> AuthRepository {
    FirebaseAuthRepository()
  }

  static func makeUserRepository() -> UserRepository {
    BaseUserRepository(userRemoteDS: makeUserRemoteDS())
  }

  // MARK: Use Cases
  static func makeValidateName() -> ValidateNameUseCase {
    ValidateName()
  }

  static func makeValidateEmailAddress() -> ValidateEmailAddressUseCase {
    ValidateEmailAddress()
  }

  static func makeValidatePassword() -> ValidatePasswordUseCase {
    ValidatePassword()
  }

  static func makeSignUpUser() -> SignUpUserUseCase {
    SignUpUser(authRepository: makeAuthRepository(), userRepository: makeUserRepository())
  }

  static func makeLogInUser() -> LogInUserUseCase {
    LogInUser(repository: makeAuthRepository())
  }

  static func makeListenUserAuthChanges() -> ListenUserAuthChangesUseCase {
    ListenUserAuthChanges(repository: makeAuthRepository())
  }

  // MARK: View Models
  static func makeSignUpViewModel() -> SignUpViewModel {
    SignUpViewModel(validateEmail: makeValidateEmailAddress(), validateName: makeValidateName(), validatePassword: makeValidatePassword(), signUpUser: makeSignUpUser())
  }

  static func makeLogInViewModel() -> LoginViewModel {
    LoginViewModel(validateEmail: makeValidateEmailAddress(), validatePassword: makeValidatePassword(), logInUser: makeLogInUser())
  }
}
