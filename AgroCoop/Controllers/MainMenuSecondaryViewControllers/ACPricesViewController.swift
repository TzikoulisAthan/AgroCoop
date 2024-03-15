//
//  ACPricesViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

//TODO: IMPLEMENT AN EMPTY STATE SCREEN. USE IN ANY VIEWCONTROLLER THAT PERFORMS NETWORK TASKS


import UIKit

/// Controller that handles the view of the product prices 
final class ACPricesViewController: UIViewController {
    
    //MARK: - Variables declaration    
    private let pricesView = ACPricesViewControllerView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.tabBar.isHidden = true

    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        title = "Current Prices"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(pricesView)
        pricesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pricesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pricesView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            pricesView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            pricesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }

}



