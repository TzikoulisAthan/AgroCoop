//
//  ACPricingPolicyViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 23/1/24.
//

import UIKit

final class ACMembershipPolicyViewController: UIViewController {
    
    //MARK: - Variable declaration
    private let membershipPolicyView = ACMembershipPolicyViewControllerView()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Articles of Incorporation"
        
        view.addSubview(membershipPolicyView)
        membershipPolicyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            membershipPolicyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            membershipPolicyView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            membershipPolicyView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            membershipPolicyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}
