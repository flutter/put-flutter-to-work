//
//  ContentView.swift
//  newsfeed_app
//

import Flutter
import SwiftUI
import UIKit

struct ContentView: View {

  init() {
    UINavigationBar.appearance().barTintColor = .white
  }

  var body: some View {
    NavigationView {
      EndlessList()
        .background(.clear)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .principal) {
            HStack(alignment: .top) {
              Text("appName".localized()).font(.system(size: 24, weight: .bold))
              Circle().frame(width: 8, height: 8)
                .foregroundColor(.blue)
            }
          }
        }
    }
    .navigationViewStyle(.stack)
  }
}

struct ContentViewPreviews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(FlutterDependencies())
  }
}
