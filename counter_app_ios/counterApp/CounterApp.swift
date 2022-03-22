//
//  CounterApp.swift
//  counter_app
//

import SwiftUI

@main
struct CounterApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

extension String {
  func localized() -> String {
    return NSLocalizedString(
      self, tableName: "Localizable", bundle: .main, value: self, comment: self)
  }
}
