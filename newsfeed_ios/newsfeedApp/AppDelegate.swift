//
//  NewsfeedApp.swift
//  newsfeed_app
//

import Foundation
import Flutter

class AppDelegate: FlutterAppDelegate, ObservableObject {
  let npsflutterEngine = FlutterEngine(name: "flutter_nps_engine")

  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    npsflutterEngine.run()
    return true
  }
}
