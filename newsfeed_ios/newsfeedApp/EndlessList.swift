//
//  EndlessList.swift
//  newsfeed_app
//

import Flutter
import SwiftUI
import UIKit

struct EndlessList: View {

  @EnvironmentObject var flutterDependencies: FlutterDependencies

  @StateObject var dataSource = ContentDataSource()
  @State var wasOpened = false

  var body: some View {
    List {
      ForEach(dataSource.items, id: \.self) { item in
        RowItem(id: item)
          .onAppear {
            dataSource.loadMoreContentIfNeeded(currentItem: item)
            if item == 10 && wasOpened == false {
              openFlutterApp()
              wasOpened = true
            }
          }.listRowSeparator(.hidden)
      }
      if dataSource.isLoadingPage {
        HStack {
          Spacer()
          ProgressView()
          Spacer()
        }
      }
    }
  }

  func openFlutterApp() {
    // Get the RootViewController.
    guard
      let windowScene = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
      let window = windowScene.windows.first(where: \.isKeyWindow),
      let rootViewController = window.rootViewController
    else { return }
    
    // Create the FlutterViewController.
    let flutterViewController = FlutterViewController(
      engine: flutterDependencies.npsFlutterEngine,
      nibName: nil,
      bundle: nil)
    flutterViewController.modalPresentationStyle = .overCurrentContext
    flutterViewController.isViewOpaque = false
    
    rootViewController.present(flutterViewController, animated: true)
  }
}
