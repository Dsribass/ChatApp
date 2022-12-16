//
//  ValidatePasswordTests.swift
//  DomainTests
//
//  Created by Daniel de Souza Ribas on 16/12/22.
//

import XCTest
@testable import Domain

final class ValidatePasswordTests: XCTestCase {
  private var usecase: ValidatePassword!

  override func setUp() {
    usecase = ValidatePassword()
  }

  override func tearDown() {
    usecase = nil
  }

  func test_validPassword() {
    let sut = usecase.execute(password: "12345678")

    XCTAssertEqual(sut, .valid)
  }

  func test_emptyPassword() {
    let sut = usecase.execute(password: "")

    XCTAssertEqual(sut, .empty)
  }

  func test_invalidPasswordLength() {
    let sut = usecase.execute(password: "1234567")

    XCTAssertEqual(sut, .invalidLength)
  }
}

