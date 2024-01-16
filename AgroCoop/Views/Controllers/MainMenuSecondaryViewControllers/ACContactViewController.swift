//
//  ACContactViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

/// Controller that manages the contact information with the coop
final class ACContactViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Contact us"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
    }

}
