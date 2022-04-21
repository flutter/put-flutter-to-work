//
//  EndlessList.swift
//  newsfeed_app
//

import Flutter
import SwiftUI
import UIKit

struct EndlessList: View {

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
    let flutterViewController = FlutterViewController(
      engine: AppState.shared.flutterEngine, nibName: nil, bundle: nil)
    flutterViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    flutterViewController.isViewOpaque = false

    let keyWindow = UIApplication.shared.connectedScenes
      .filter({ $0.activationState == .foregroundActive })
      .compactMap({ $0 as? UIWindowScene })
      .first?.windows
      .filter({ $0.isKeyWindow }).first
    keyWindow?.rootViewController?.present(flutterViewController, animated: true, completion: nil)
  }
}
