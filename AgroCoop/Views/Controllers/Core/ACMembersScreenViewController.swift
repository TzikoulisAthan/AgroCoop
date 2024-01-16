//
//  ACMembersScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit

/// Controller that handles the view of the member's area of the app
final class ACMembersScreenViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Welcome Member"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
    }
}
