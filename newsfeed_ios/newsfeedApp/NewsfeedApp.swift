//
//  NewsfeedApp.swift
//  newsfeed_app
//

import Flutter
import FlutterPluginRegistrant
import SwiftUI

@main
struct NewsfeedApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

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
