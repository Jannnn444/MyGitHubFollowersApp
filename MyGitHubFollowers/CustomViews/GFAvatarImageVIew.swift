//
//  GFAvatarImageVIew.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/28.
//

import UIKit

class GFAvatarImageVIew: UIImageView {
    
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
     
}
