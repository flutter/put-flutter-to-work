//
//  ContentDataSource.swift
//  newsfeed_app
//

import Combine
import Foundation
import SwiftUI

@MainActor class ContentDataSource: ObservableObject {

  @Published var items: [Int] = Array(0...9)
  @Published var isLoadingPage = false
  private var currentPage = 1
  private var canLoadMorePages = true

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

    // Mimic the network delay.
    do {
      try await Task.sleep(nanoseconds: 2_000_000_000)
    } catch {}

    canLoadMorePages = true
    items += Array(items.count...items.count+9)
    isLoadingPage = false
  }
}
