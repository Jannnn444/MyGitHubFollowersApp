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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {

 //      textColor = UIColor.darkGray
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10  // edges of textField
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        
        textColor = .label  // this is a color called .label
        tintColor = .label  // day mode black, night mode white
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth       = true
        minimumFontSize                = 12
        
        backgroundColor                = .tertiarySystemBackground
        autocorrectionType             = .no
        
        placeholder = "Enter a username thx"
        
    }
}
