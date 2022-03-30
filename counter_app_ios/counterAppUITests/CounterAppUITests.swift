//
//  counter_appUITests.swift
//  counter_appUITests
//
//  Created by Jan Stepien on 02/02/2022.
//

import XCTest

class CounterAppUITests: XCTestCase {

  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  func testViewWasLoadedCorrectly() throws {
    let app = XCUIApplication()
    app.launch()

    XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "newsfeed").exists)
    XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "Category").exists)
    XCTAssertTrue(
      app.staticTexts.element(matching: .any, identifier: "Lorem ipsum dolor sit amet...").exists)
    XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "13 Jan, 2022").exists)
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
