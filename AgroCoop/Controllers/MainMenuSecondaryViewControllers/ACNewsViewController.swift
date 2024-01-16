//
//  ACNewsViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

/// Controller that manages the news section of the app
final class ACNewsViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "News"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
    }

}
