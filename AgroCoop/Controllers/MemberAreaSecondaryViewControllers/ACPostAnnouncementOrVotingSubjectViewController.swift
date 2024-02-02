//
//  ACPostAnnouncementOrVotingSubjectViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 29/1/24.
//

import UIKit

class ACPostAnnouncementOrVotingSubjectViewController: UIViewController, ACPostAnnouncementOrVotingSubjectViewModelDelegate {

    //MARK: - Variable declaration
    private let postView = ACPostAnnouncementOrVotingSubjectViewControllerView()
    private let postViewModel = ACPostAnnouncementOrVotingSubjectViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        postView.delegate = postViewModel
        postViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.tabBar.isHidden = true

    }
    
    //MARK: - Functions
    func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Post"
        view.addSubview(postView)
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.leftAnchor.constraint(equalTo: view.leftAnchor),
            postView.rightAnchor.constraint(equalTo: view.rightAnchor),
            postView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
