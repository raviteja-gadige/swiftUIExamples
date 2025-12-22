//
//  PostViewModel.swift
//  CombineExample
//
//  Created by Apple on 30/11/25.
//

import Foundation
import Combine

struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        fetchPosts()
    }
    
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
            .store(in: &cancellable)
    }
}
