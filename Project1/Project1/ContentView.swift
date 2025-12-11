//
//  ContentView.swift
//  Project1
//
//  Created by Apple on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
  var body: some View {
        NavigationView {
          List(vm.posts, id: \.id) { post in
              VStack(alignment: .leading) {
                  Text(post.title)
                      .font(.headline)
                  Text(post.body)
                      .font(.body)
                      .foregroundColor(.gray)
              }
          }
          .onAppear() {
              vm.fetchPosts()
          }
          .navigationTitle("Posts")
      }
  }
}


struct ContentView_previews : PreviewProvider {
    static var previews: some View  {
        ContentView()
    }
}
