//
//  ContentView.swift
//  StateExample
//
//  Created by Apple on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
           Text("count = \(counter)")
            Button("Increment") {
                counter += 1
            }
            .padding()
        }
    }
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
