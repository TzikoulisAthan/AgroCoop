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
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Articles of Incorporation"
        
        view.addSubview(membershipPolicyView)
        membershipPolicyView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            membershipPolicyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: padding),
            membershipPolicyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            membershipPolicyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            membershipPolicyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(padding*3))
        ])
    }
}
