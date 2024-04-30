//
//  MainTabController.swift
//  YouTubeClone
//
//  Created by yujaehong on 4/15/24.
//

import UIKit

class MainTabController: UITabBarController {
   
    override func viewDidLoad() {
        view.backgroundColor = .white
  
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        view.backgroundColor = .white
        
        let home = templateNavigationViewController(title: "홈", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: HomeViewController())
        let shorts = templateNavigationViewController(title: "Shorts", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: ShortsViewController())
        let add = templateNavigationViewController(title: "추가", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: AddViewController())
        let sub = templateNavigationViewController(title: "구독", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: SubscribeViewController())
        let strg = templateNavigationViewController(title: "삭제", unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: StorageViewController())
                                                    
        viewControllers = [home, shorts, add, sub, strg]
        tabBar.tintColor = .black
    }
    
    private func templateNavigationViewController(title: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
