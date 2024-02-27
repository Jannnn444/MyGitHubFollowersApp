//
//  NetworkManager.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/27.
//

import Foundation

class NetworkManager {
    
    // MARK: Singleton
    
    static let shared           = NetworkManager()
    let baseURL                 = "https://api.github.com/users/"
    
    
    private init() {}
    
    func getFollower(for username: String, pages: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(pages)"
        
        // use else to show error message
        guard let url = URL(string: endpoint) else {
            // if the completed follower can't read as nil, show errorMessaage.
            completed(nil,. invalidUsername )
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, .unableToComplete)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                // completed(nil, error.localizedDescription)
                completed(nil, .invalidData)
            }
            
            
        }
        task.resume()
    }
}





















