//
//  NewsfeedApp.swift
//  newsfeed_app
//

import Flutter
import FlutterPluginRegistrant
import SwiftUI

class AppState: ObservableObject {
  static let shared = AppState()
  @Published var flutterEngine = FlutterEngine(name: "flutter_nps_engine")

  init() {
    flutterEngine.run()
  }
}

@main
struct NewsfeedApp: App {

  @StateObject var appState = AppState.shared

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
