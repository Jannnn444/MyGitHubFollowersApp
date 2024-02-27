//
//  SceneDelegate.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // Setting the App window screen
    var window: UIWindow?

    // This is a unique function for setting app screen, tells app this window will connect to the app, to use it, we change _ into a variable & give name as following.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Initailize the variable give it a name
        // Here make sure the scene as the UIWindow? or else dont do anything
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Set a new window, the frame big as the screen bounds
        window                   = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        // This new window set as the windowScene we just set.
        window?.windowScene        = windowScene
        
        // Tell app start from this window (RootViewCopntroller)
        // placeholder, empty
        window?.rootViewController  = createTabbar()
        
        // Display the window, make user see it.
        window?.makeKeyAndVisible()
        
        
        configureNavigationBar() 
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchVC                       = SearchVC()
        searchVC.title                     = "Search"
        searchVC.tabBarItem                = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesListVC                = FavoritesListVC()
        favoritesListVC.title              = "Favorites"
        favoritesListVC.tabBarItem         = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
    
    func createHistoryNC() -> UINavigationController {
        
        let historVC = HistoryVC()
        historVC.title                    = "History"
        historVC.tabBarItem               = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        return UINavigationController(rootViewController: historVC)
    }
    
    
    
    func createTabbar() -> UITabBarController {
        let tabbar                        = UITabBarController()
        UITabBar.appearance().tintColor   = .systemGreen
        tabbar.viewControllers            = [createSearchNC(), createFavoritesNC(), createHistoryNC()]
        
        return tabbar
    }
    
    // all the navigationbar will be in this settings
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

