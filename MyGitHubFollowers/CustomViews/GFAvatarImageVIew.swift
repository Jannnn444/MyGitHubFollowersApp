//
//  GFAvatarImageVIew.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/28.
//

import UIKit

class GFAvatarImageVIew: UIImageView {
    
    let cache            = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: API - Download Images
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data ,response, error in
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return } // pass the data we checked in
            
            self.cache.setObject(image, forKey: cacheKey)
            
            //updating UI
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
        task.resume()  //kicks off the network call
    }
}

