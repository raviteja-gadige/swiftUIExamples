//
//  ContentView.swift
//  Project1
//
//  Created by Apple on 29/11/25.
//

import SwiftUI

struct ContentView: View {
  @State private var isSelected = false

  var body: some View {
    Button(action: {
      isSelected.toggle()
    }) {
      Image("Profile")
        .renderingMode(.template)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
        .foregroundColor(isSelected ? .brown : .gray)
    }
  }
}


struct ContentView_previews : PreviewProvider {
    static var previews: some View  {
        ContentView()
    }
}
