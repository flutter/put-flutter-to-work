//
//  ContentView.swift
//  counter_app
//
//  Created by Jan Stepien on 02/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0;
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Text("You have pushed the button this many times:")
                        .font(.system(size: 16))
                    Text("\(count)")
                        .font(.system(size: 34))
                        .foregroundColor(.gray)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            count+=1;
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                            .background(Color.blue)
                            .cornerRadius(38.5)
                            .padding()
                            .shadow(
                                color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Ios Demo Home Page")
                        .font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
