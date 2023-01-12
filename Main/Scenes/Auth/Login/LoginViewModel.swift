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
  private let logInUser: LogInUserUseCase

  private let bag = DisposeBag()

  typealias EmailAndPassword = (email: String, password: String)
  private let onLoginSubject = PublishSubject<EmailAndPassword>()
  var onLogin: Observable<EmailAndPassword> { onLoginSubject }

  private let onEmailStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onEmailStatus: Observable<ValidationResult> { onEmailStatusSubject }

  private let onPasswordStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onPasswordStatus: Observable<ValidationResult> { onPasswordStatusSubject }

  private let onLoginActionSubject = PublishSubject<LoginAction>()
  var onLoginAction: Observable<LoginAction> { onLoginActionSubject }

  init(
    validateEmail: ValidateEmailAddressUseCase,
    validatePassword: ValidatePasswordUseCase,
    logInUser: LogInUserUseCase
  ) {
    self.validateEmail = validateEmail
    self.validatePassword = validatePassword
    self.logInUser = logInUser

    listenObservables()
  }

  private func listenObservables() {
    onLogin
      .filter { [unowned self] email, password in
        let emailValidation = validateEmail.execute(email: email)
        let passwordValidation = validatePassword.execute(password: password)

        onEmailStatusSubject.onNext(emailValidation)
        onPasswordStatusSubject.onNext(passwordValidation)

        return emailValidation == .valid && passwordValidation == .valid
      }
      .bind { [unowned self] email, password in
        self.logInUser.execute(withEmail: email, andPassword: password)
          .subscribe { [weak self] result in
            if result == .success {
              self?.onLoginActionSubject.onNext(.loginSuccess)
            } else {
              self?.onLoginActionSubject.onNext(.loginFailed)
            }
          } onFailure: { [weak self] _ in
            self?.onLoginActionSubject.onNext(.loginError)
          }
          .disposed(by: bag)
      }
      .disposed(by: bag)
  }

  func login(withEmail email: String, andPassword password: String) {
    onLoginSubject.onNext((email, password))
  }
}

enum LoginAction {
  case loginSuccess, loginFailed, loginError
}
