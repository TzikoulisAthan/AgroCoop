//
//  ACContactViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

/// Controller that manages the contact information with the coop
final class ACContactViewController: UIViewController {
    
    //MARK: - Variable declaration
    private let contactView = ACContactViewControllerView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Contact us"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        
        view.addSubview(contactView)
        contactView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contactView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contactView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
