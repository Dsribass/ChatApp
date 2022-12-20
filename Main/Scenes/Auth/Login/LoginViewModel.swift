//
//  LoginPresenter.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 16/12/22.
//

import Foundation
import RxSwift
import Domain

class LoginViewModel {
  private let validateEmail: ValidateEmailAddressUseCase
  private let validatePassword: ValidatePasswordUseCase

  private let bag = DisposeBag()

  typealias EmailAndPassword = (email: String, password: String)
  private let onLoginSubject = PublishSubject<EmailAndPassword>()
  var onLogin: Observable<EmailAndPassword> { onLoginSubject }

  private let onEmailStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onEmailStatus: Observable<ValidationResult> { onEmailStatusSubject }

  private let onPasswordStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onPasswordStatus: Observable<ValidationResult> { onPasswordStatusSubject }

  init(validateEmail: ValidateEmailAddressUseCase, validatePassword: ValidatePasswordUseCase) {
    self.validateEmail = validateEmail
    self.validatePassword = validatePassword

    onLogin
      .map { [weak self] email, password in
        let emailValidation = validateEmail.execute(email: email)
        let passwordValidation = validatePassword.execute(password: password)

        self?.onEmailStatusSubject.onNext(emailValidation)
        self?.onPasswordStatusSubject.onNext(passwordValidation)

        return emailValidation == .valid && passwordValidation == .valid
      }
      .bind { _ in }
      .disposed(by: bag)
  }

  func login(withEmail email: String, andPassword password: String) {
    onLoginSubject.onNext((email, password))
  }
}
