//
//  ContentDataSource.swift
//  counter_app
//

import Combine
import Foundation
import SwiftUI

@MainActor class ContentDataSource: ObservableObject {

  @Published var items: [Int] = []
  @Published var isLoadingPage = false
  private var currentPage = 1
  private var canLoadMorePages = true

  init() {
    for i in (0...9) {
      items.append(i)
    }
  }

  func loadMoreContentIfNeeded(currentItem item: Int?) {
    guard let item = item else {
      Task {
        await loadMoreContent()
      }
      return
    }

    let thresholdIndex = items.index(items.endIndex, offsetBy: -5)
    if items.first(where: { $0 == item }) == thresholdIndex {
      Task {
        await loadMoreContent()
      }
    }
  }

  private func loadMoreContent() async {
    guard !isLoadingPage && canLoadMorePages else {
      return
    }

    isLoadingPage = true

    do {
      try await Task.sleep(nanoseconds: 2_000_000_000)
    } catch {}

    canLoadMorePages = true
    var cardNamesArray: [Int] = []
    for i in items.count...items.count + 9 {
      cardNamesArray.append(i)
    }
    items = items + cardNamesArray
    isLoadingPage = false
  }
}
