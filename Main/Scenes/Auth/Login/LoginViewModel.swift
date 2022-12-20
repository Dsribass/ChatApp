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
  let onClickSubmitButtonSubject = PublishSubject<EmailAndPassword>()
  var onClickSubmitButton: Observable<EmailAndPassword> { onClickSubmitButtonSubject }

  let onEmailStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  let onPasswordStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)

  init(validateEmail: ValidateEmailAddressUseCase, validatePassword: ValidatePasswordUseCase) {
    self.validateEmail = validateEmail
    self.validatePassword = validatePassword

    onClickSubmitButton
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
}
