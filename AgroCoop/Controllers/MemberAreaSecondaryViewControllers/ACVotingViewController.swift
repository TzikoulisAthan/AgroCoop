//
//  ACVotingViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 9/2/24.
//

import UIKit

class ACVotingViewController: UIViewController {
    
    //MARK: - Variable declaration
    private let votingView = ACVotingViewControllerView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //votingView.setupUI()
    }

    
    //MARK: - Functions
    
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Voting Subjects"
        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.addSublayer(gradientLayer)
        
        view.addSubview(votingView)
        votingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            votingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            votingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            votingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            votingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
