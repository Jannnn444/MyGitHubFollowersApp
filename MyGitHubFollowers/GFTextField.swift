//
//  GFTextField.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/16.
//

import UIKit


class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //call!
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Create configure
    
    private func configure() {

        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius                  = 10
        layer.borderWidth                   = 2
        layer.borderColor                   = UIColor.systemGray4.cgColor
        
        textColor                           = .label  // this color option balck in light mode white in dark mode
        tintColor                           = .label
        textAlignment                       = .center
        font                                = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth           = true
        minimumFontSize                     = 12
        
        backgroundColor                     = .tertiarySystemGroupedBackground
        autocorrectionType                  = .no
        keyboardType                        = .default
        returnKeyType                       = .go
        placeholder                         = "Enter a username here"
    }
}
