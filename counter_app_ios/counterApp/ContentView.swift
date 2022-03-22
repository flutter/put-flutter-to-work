//
//  ContentView.swift
//  counter_app
//

import Flutter
import SwiftUI
import UIKit

struct ContentView: View {
    
  init() {
    UITableView.appearance().backgroundColor = .clear
    UINavigationBar.appearance().barTintColor = .white
  }
    
  var body: some View {
    NavigationView {
      EndlessList()
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
  }
}

struct ContentViewPreviews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
