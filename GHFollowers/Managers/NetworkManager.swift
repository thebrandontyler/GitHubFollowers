//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Brandon Tyler on 2/1/20.
//  Copyright © 2020 Brandon Maynard. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completionHandler: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(nil, "This username created an invalid request.  Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completionHandler(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completionHandler(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(followers, nil)
            } catch {
                completionHandler(nil, "The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
