//
//  counter_appTests.swift
//  counter_appTests
//
//  Created by Jan Stepien on 02/02/2022.
//

import XCTest

@testable import counter_app

class ContentDataSourceTests: XCTestCase {

  func testHasItemsInitialized() async {
    let sut = await ContentDataSource()

    let count = await sut.items.count

    XCTAssertEqual(count, 10, "Bad initialization")
  }

  func testLoadMoreNotAddIfNotLastItemIndexGiven() async {
    let sut = await ContentDataSource()
    let lastIndex = await sut.items.count - 1
    XCTAssertNotEqual(8, lastIndex, "Last index given")

    await sut.loadMoreContentIfNeeded(currentItem: 8)

    let count = await sut.items.count
    XCTAssertEqual(count, 10, "Didnt load correct amount of items")
  }
}
