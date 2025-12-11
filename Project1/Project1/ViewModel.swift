//
//  ViewModel.swift
//  Project1
//
//  Created by Apple on 11/12/25.
//

import SwiftUI
import Combine

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body : String
}

class ViewModel : ObservableObject {
    @Published var posts: [Post] = []
    private var cancelable = Set<AnyCancellable>()
    
    func fetchPosts() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        URLSession.shared.dataTaskPublisher(for: url!)
            .map( \.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
                
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancelable)
    }
}
