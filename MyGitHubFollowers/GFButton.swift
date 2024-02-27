//
//  GFButton.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/16.
//

import UIKit

class GFButton: UIButton {

    // init -> default initializer
    override init(frame: CGRect) {
        
        // call the default one by calling SUPER.init(frame: code)
        // superclass of the parent, default UIButton
        // GIButton is a child class, it inherits the parent's features
        super.init(frame: frame)
        // custom code
        
        configure()
        
    }
    
    // get the "fixed" fill in these by system
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // create our own init
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)  // we will frame with autolayout, here can set 0
        // self means this GFButton background color = the background color we passed in
        self.backgroundColor = backgroundColor
        // this setTitle will be input the taxt from our init future title String
        self.setTitle(title, for: .normal)
            
        configure()  
    }
    
    // MARK: Configure TitleLabel
    // private mean this configured method can only call inside this file
    // so won't call this outside this initialize button
    private func configure() {
        layer.cornerRadius        = 10
        titleLabel?.textColor     = .white
        titleLabel?.font         = UIFont.preferredFont(forTextStyle: .headline) // Bold
        
        // anytime we initialize GFButton, UIButton, VC && we WANT autolayout need this line
        translatesAutoresizingMaskIntoConstraints = false
    }
}
