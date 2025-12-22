//
//  ContentView.swift
//  CombineExample
//
//  Created by Apple on 30/11/25.
//

import SwiftUI

// SwiftUI ContentView displaying fetched data
struct ContentView: View {
    @StateObject var vm = PostViewModel()
    
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

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
