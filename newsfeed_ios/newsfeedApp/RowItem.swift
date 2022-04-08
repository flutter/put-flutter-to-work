//
//  RowItem.swift
//  newsfeed_app
//

import Foundation
import SwiftUI
import UIKit

struct RowItem: View {
  let id: Int

  init(id: Int) {
    self.id = id
  }

  var body: some View {
    HStack {
      switch id % 3 {
      case 0:
        Image("TemplateImage").frame(alignment: .leading)
      case 1:
        Image("TemplateImage2").frame(alignment: .leading)
      default:
        Image("TemplateImage3").frame(alignment: .leading)
      }
      VStack(alignment: .leading, spacing: 8) {
        Text("category".localized()).font(.system(size: 18, weight: .bold)).foregroundColor(.gray)
        Text("content".localized()).font(.system(size: 16, weight: .bold))
        HStack {
          Spacer()
          Text("date".localized()).frame(alignment: .trailing).font(.system(size: 16))
            .foregroundColor(.gray)
        }
      }.padding(.leading, 16)
    }
  }
}
