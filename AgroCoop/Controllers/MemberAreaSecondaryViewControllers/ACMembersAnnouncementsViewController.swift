//
//  ACMembersAnnouncementsViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 23/1/24.
//

import UIKit

/// Responsible for showing announcements only for members of the coop
final class ACMembersAnnouncementsViewController: UIViewController {
    
    //MARK: - Variable declaration
    private let announcementsView = ACMembersAnnouncementsViewControllerView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.tabBar.isHidden = true

    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Announcements"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(announcementsView)
        announcementsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            announcementsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            announcementsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            announcementsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            announcementsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
