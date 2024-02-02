//
//  ACNewsViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

/// Controller that manages the news section of the app
final class ACNewsViewController: UIViewController, ACNewsViewControllerViewDelegate {

    
    
    //MARK: - Variable declaration
    private let viewModel = ACNewsViewControllerViewModel()
    private let newsView = ACNewsViewControllerView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        newsView.delegate = self
        viewModel.getNews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    //MARK: - Functions
    func presentDetailViewController(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "News"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        
        view.addSubview(newsView)
        newsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            newsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            newsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
