//
//  GFBodyLabel.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/24.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // custom initiallizer difference with title label, the above are the same
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure() {
        textColor                          = .secondaryLabel
        //light grey color
        font                               = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth          = true
        minimumScaleFactor                 = 0.9
        lineBreakMode                      = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}








