//
//  NewsfeedApp.swift
//  newsfeed_app
//

import Flutter
import FlutterPluginRegistrant
import SwiftUI

class FlutterDependencies: ObservableObject {
  let npsFlutterEngine = FlutterEngine(name: "flutter_nps_engine")
  // ...
  // Add your other flutter engines here

  init() {
    // Run the npsFlutterEngine when we launch the app, to ensure a smoother NPS experience. However this means app launch can take a longer time.
    npsFlutterEngine.run()
  }
}

@main
struct NewsfeedApp: App {

  // flutterDependencies will be injected using EnvironmentObject
  @StateObject var flutterDependencies = FlutterDependencies()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(flutterDependencies)
    }
  }
}

extension String {
  func localized() -> String {
    return NSLocalizedString(
      self, tableName: "Localizable", bundle: .main, value: self, comment: self)
  }
}
