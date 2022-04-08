//
//  NewsfeedApp.swift
//  newsfeed_app
//

import SwiftUI

@main
struct NewsfeedApp: App {
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
