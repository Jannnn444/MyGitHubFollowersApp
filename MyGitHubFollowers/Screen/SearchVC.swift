//
//  SearchVC.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/16.
//


import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()   // call this customm initializer, can it will call the congigure() inside
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    // check if the username empty in a computer property
    // if the username not empty return true
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground // -> adapt whitemode white, black mode black
        configureLogoImagedView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    // Lifecycle method view
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
     // navigationController?.isNavigationBarHidden = true   // the blure narrow left top
     // better way when u switch back the navigationBar didn't dissappeared
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        // we can customize the return button on keyboard
    }
    
    // using hashtag selector are from object c
    // when tap go button on keyboard
    @objc func pushFollowerListVC() {
    
        // the guard statment in computer property
        // MARK: Custom Alert
        guard isUsernameEntered  else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We want to know who to look for.😀", buttonTitle: "Ok")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    // MARK: Draw our UI patterns
    
    func configureLogoImagedView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false // this for the regular UIImageView(0
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self  // essential for delegate !
        
        NSLayoutConstraint.activate([
        
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            // call the button at the bottom
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)

            
        ])
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //when pressing go on keyboard, this print
        pushFollowerListVC()
        pushFollowerListVC()
        return true
    }
}

 
