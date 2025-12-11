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

// ViewModel to handle networking and data flow
class PostViewModel: ObservableObject {
    // Published property to notify view of data changes
    @Published var posts: [Post] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        // Replace with your API endpoint URL
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else { return }
        
        let subscription = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Extract data from response
            .decode(type: [Post].self, decoder: JSONDecoder()) // Decode JSON into array of Posts
            .replaceError(with: []) // Replace errors with an empty array
            .receive(on: DispatchQueue.main) // Receive on main queue to update UI
            .sink(receiveValue: { [weak self] fetchedPosts in
                self?.posts = fetchedPosts // Update posts with fetched data
            })
        subscription.store(in: &cancellable)
    }
}
