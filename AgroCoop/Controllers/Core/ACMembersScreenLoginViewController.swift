//
//  ACMembersScreenLoginViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 22/1/24.
//

import UIKit
import FirebaseAuth


//TODO: Add pod to push textfields up not to be covered by the keyboard

/// Handles the functionality for logging into the Member's Area
final class ACMembersScreenLoginViewController: UIViewController, ACMembersLoginDelegate {

    //MARK: - Variable declaration
    private let membersAreaLoginView = ACMembersScreenLoginViewControllerView()
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.white.cgColor, UIColor.green.withAlphaComponent(1).cgColor]
        return layer
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        membersAreaLoginView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Functions
    func didTapLogin(email: String, password: String) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            guard error == nil else {
                print(error)
                return
            }
            
            let vc = ACMembersScreenViewController()
            vc.title = "Members Area"
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func didTapCreateAccount() {
        let vc = ACContactViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        
        
        view.addSubview(membersAreaLoginView)
        membersAreaLoginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            membersAreaLoginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            membersAreaLoginView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            membersAreaLoginView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            membersAreaLoginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
