//
//  SignUpViewModel.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 21/12/22.
//

import RxSwift
import Domain

class SignUpViewModel {
  private let validateEmail: ValidateEmailAddressUseCase
  private let validateName: ValidateNameUseCase
  private let validatePassword: ValidatePasswordUseCase

  private let bag = DisposeBag()

  let onClickSubmitButtonSubject = PublishSubject<(name: String, email: String, password: String)>()
  var onClickSubmitButton: Observable<(name: String, email: String, password: String)> { onClickSubmitButtonSubject }

  private let onNameStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onNameStatus: Observable<ValidationResult> { onNameStatusSubject }

  private let onEmailStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onEmailStatus: Observable<ValidationResult> { onEmailStatusSubject }

  private let onPasswordStatusSubject = BehaviorSubject<ValidationResult>(value: .valid)
  var onPasswordStatus: Observable<ValidationResult> { onPasswordStatusSubject }

  init(
    validateEmail: ValidateEmailAddressUseCase,
    validateName: ValidateNameUseCase,
    validatePassword: ValidatePasswordUseCase
  ) {
    self.validateEmail = validateEmail
    self.validateName = validateName
    self.validatePassword = validatePassword

    onClickSubmitButton
      .map { [weak self] name, email, password in
        let nameValidation = validateName.execute(name: name)
        let emailValidation = validateEmail.execute(email: email)
        let passwordValidation = validatePassword.execute(password: password)

        self?.onNameStatusSubject.onNext(nameValidation)
        self?.onEmailStatusSubject.onNext(emailValidation)
        self?.onPasswordStatusSubject.onNext(passwordValidation)

        return nameValidation == .valid &&
        emailValidation == .valid &&
        passwordValidation == .valid
      }
      .bind { _ in }
      .disposed(by: bag)
  }

  func register(withName name: String, email: String, andPassword password: String) {
    onClickSubmitButtonSubject.onNext((name: name, email: email, password: password))
  }
}
