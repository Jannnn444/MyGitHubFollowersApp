//
//  FollowerListVC.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/24.
//

import UIKit

class FollowerListVC: UIViewController {

    enum Section { case main }
    
    var username: String!
    var followers: [Follower] = []
    
    var collectionView: UICollectionView! //visualize the collection view
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        configureCollectionView()
        getFollowers()
        configureDataSource()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//      navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
     
    }
    
    func configureCollectionView() {
        // initialize the collectionView first in this configure method
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    

    func getFollowers() {
        
        NetworkManager.shared.getFollower(for: username, pages: 1) { [weak self] result in
        guard let self = self else { return }
        
        // self = followerListVC
            
        switch result {
        case .success(let followers):
            
        self.followers = followers
        self.updateData()                   // for get the searchFollowers
            
        case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Error Happened", message: error.rawValue, buttonTitle: "Ok")
            
// if success print followers, if error go back to our networkManager for checking, and get raw values from ErrorEnum
        }
     }
   }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
         cell.set(follower: follower)
            
         return cell
        })
    }
    
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        dataSource.apply(snapshot, animatingDifferences: true)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true)}
        
    }
}
