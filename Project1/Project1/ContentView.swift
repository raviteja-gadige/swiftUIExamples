//
//  ContentView.swift
//  Project1
//
//  Created by Apple on 29/11/25.
//

import SwiftUI


struct DetailView: View {
    var body: some View {
        Text("Detail Screen")
            .navigationTitle("Details")
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .padding()
            Button(action: {
                 print("Button Pressed")
               }, label: {
                 Text("Press Me!")
                   .font(.largeTitle)
                   .foregroundColor(.white)
               })
               .padding()
               .background(
                 LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
               )
               .cornerRadius(10)
        }
    }
}

struct ContentView_previews: PreviewProvider {
   static var previews: some View {
        ContentView()
    }
}
