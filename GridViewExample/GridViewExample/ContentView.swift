//
//  ContentView.swift
//  GridViewExample
//
//  Created by Apple on 30/11/25.
//

import SwiftUI

struct ContentView: View {
  let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    LazyVGrid(columns: columns, spacing: 16) {
      ForEach(items, id: \.self) { item in
        Text(item)
          .frame(maxWidth: .infinity)
          .frame(height: 100)
          .background(.blue)
          .foregroundColor(.white)
      }
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
