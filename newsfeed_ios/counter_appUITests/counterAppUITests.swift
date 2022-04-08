//
//  counter_appUITests.swift
//  counter_appUITests
//
//  Created by Jan Stepien on 02/02/2022.
//

import XCTest

class CounterAppUITests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testButtonTapIncreasesCounter() throws {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()

    XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "0").exists)
    XCTAssertTrue(!app.staticTexts.element(matching: .any, identifier: "1").exists)

    app.buttons["+"].tap()

    XCTAssertTrue(!app.staticTexts.element(matching: .any, identifier: "0").exists)
    XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "1").exists)

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
