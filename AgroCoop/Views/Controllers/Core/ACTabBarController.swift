//
//  ViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit

/// A controller that sets and manages the tab bar menu
final class ACTabBarController: UITabBarController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        
        setupTabs()
    }
    
    //MARK: - UI functions
    private func setupTabs() {
        let mainVC = ACMainScreenViewController()
        let membersVC = ACMembersScreenViewController()
        
        membersVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: membersVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Members Area", image: UIImage(systemName: "person.badge.shield.checkmark"), tag: 2)
        
        nav2.navigationBar.prefersLargeTitles = true
        
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        
        setViewControllers([nav1, nav2], animated: true)
    }


}

