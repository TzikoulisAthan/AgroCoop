//
//  MainScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit
import SafariServices

/// Controller that manages the main (app intro) menu of the app
final class ACMainScreenViewController: UIViewController, ACMainScreenViewControllerViewDelegate {
    
    
    private let mainScreenView = ACMainScreenViewControllerView()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        mainScreenView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    /// Implementation of protocol function, handles the button actions from the view
    /// - Parameter buttonLabel: A var that represents the value of the string passed from the view
    func didTapButton(buttonLabel: String) {
        switch buttonLabel {
        case Constants.ButtonLabels.priceButtonLabel:
            let priceVC = ACPricesViewController()
            navigationController?.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(priceVC, animated: true)
        case Constants.ButtonLabels.contactButtonLabel:
            let contactVC = ACContactViewController()
            navigationController?.pushViewController(contactVC, animated: true)
        case Constants.ButtonLabels.newsButtonLabel:
            let newsVC = ACNewsViewController()
            navigationController?.pushViewController(newsVC, animated: true)
        case Constants.ButtonLabels.entopioButtonLabel:
            guard let url = URL(string: Constants.urls.entopioURL) else { return }
            let configuration = SFSafariViewController.Configuration()
            
            let safariController = SFSafariViewController(url: url, configuration: configuration)
            
            present(safariController, animated: true)
        default:
            break
        }
    }
    
    //MARK: - UI functions
    private func setupUI() {
        view.addSubview(mainScreenView)
        mainScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScreenView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainScreenView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mainScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
