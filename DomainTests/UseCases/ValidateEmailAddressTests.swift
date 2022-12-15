//
//  DomainTests.swift
//  DomainTests
//
//  Created by Daniel de Souza Ribas on 15/12/22.
//

import XCTest
@testable import Domain

final class ValidateEmailAddressTests: XCTestCase {
  private var usecase: ValidateEmailAddress!

  override func setUp() {
    usecase = ValidateEmailAddress()
  }

  override func tearDown() {
    usecase = nil
  }

  func test_emptyEmail() {
    let sut = usecase.execute(email: "")

    XCTAssertEqual(sut, .empty)
  }

  func test_invalidEmail_withoutTopLevelDomain() {
    let sut = usecase.execute(email: "example@example")

    XCTAssertEqual(sut, .invalid)
  }

  func test_invalidEmail_withoutDomain() {
    let sut = usecase.execute(email: "example")

    XCTAssertEqual(sut, .invalid)
  }

  func test_validEmail() {
    let sut = usecase.execute(email: "example@example.com")

    XCTAssertEqual(sut, .valid)
  }
}
