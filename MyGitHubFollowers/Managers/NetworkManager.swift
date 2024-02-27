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
    
    func getFollower(for username: String, pages: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(pages)"
        
        // use else to show error message
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Please try again.")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from the server was invalid. Please try again.")
            }
            
            
        }
        task.resume()
    }
}





















