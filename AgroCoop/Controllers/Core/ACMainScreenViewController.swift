//
//  MainScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit
import SafariServices

/// Controller that manages the main (app intro) menu of the app
final class ACMainScreenViewController: UIViewController {
    
    //MARK: - Variable declarations
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        
        return image
    }()
    
    private let motoLabel: UILabel = {
        let label = UILabel()
        label.text = "100 years of excellence and progress"
        label.font = UIFont(name: "Arial", size: 18)
        return label
    }()
    
    private let buttonPadding: CGFloat = 70
    
    private let pricesButton = ACMenuButton(title: Constants.Labels.priceButtonLabel)
    private let contactButton = ACMenuButton(title: Constants.Labels.contactButtonLabel)
    private let newsButton = ACMenuButton(title: Constants.Labels.newsButtonLabel)
    private let entopioButton = ACMenuButton(title: Constants.Labels.entopioButtonLabel)
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = false

    }
    
    //MARK: - Selector functions
    @objc private func pricesButtonTapped() {
        let pricesVC = ACPricesViewController()
        navigationController?.pushViewController(pricesVC, animated: true)
    }
    
    @objc private func contactButtonTapped() {
        let contactVC = ACContactViewController()
        navigationController?.pushViewController(contactVC, animated: true)
    }
    
    @objc private func newsButtonTapped() {
        let newsVC = ACNewsViewController()
        navigationController?.pushViewController(newsVC, animated: true)
    }
    
    
    /// Opens a in-app safari browser to show the entopio website to the user
    @objc private func entopioButtonTapped() {
        guard let url = URL(string: Constants.urls.entopioURL) else { return }
        let configuration = SFSafariViewController.Configuration()
        
        let safariController = SFSafariViewController(url: url, configuration: configuration)
        
        present(safariController, animated: true)
    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        
        let viewsArray = [logoImage, motoLabel, pricesButton, contactButton, newsButton, entopioButton]
        
        for everyView in viewsArray {
            view.addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        pricesButton.addTarget(self, action: #selector(pricesButtonTapped), for: .touchUpInside)
        contactButton.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
        newsButton.addTarget(self, action: #selector(newsButtonTapped), for: .touchUpInside)
        entopioButton.addTarget(self, action: #selector(entopioButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 225),
            logoImage.heightAnchor.constraint(equalToConstant: 225),
            
            motoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 12),
            motoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            motoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            pricesButton.topAnchor.constraint(equalTo: motoLabel.bottomAnchor, constant: 30),
            pricesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonPadding),
            pricesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonPadding),
            pricesButton.heightAnchor.constraint(equalToConstant: 52),
            
            contactButton.topAnchor.constraint(equalTo: pricesButton.bottomAnchor, constant: 30),
            contactButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonPadding),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonPadding),
            contactButton.heightAnchor.constraint(equalToConstant: 52),
            
            newsButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 30),
            newsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonPadding),
            newsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonPadding),
            newsButton.heightAnchor.constraint(equalToConstant: 52),
            
            entopioButton.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 30),
            entopioButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonPadding),
            entopioButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonPadding),
            entopioButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
