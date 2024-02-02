//
//  ACEditPricesViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 23/1/24.
//

import UIKit
import FirebaseFirestore

final class ACEditPricesViewController: UIViewController, ACEditPricesDelegate {
    
    //MARK: - Variable declaration
    private let editPricesView = ACEditPricesViewControllerView()
    
    private let db = Firestore.firestore()
    
    private let viewModel = ACEditPricesViewControllerViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        setupUI()
        editPricesView.delegate = self

    }
    
    
    //MARK: - Functions
    /// Dismisse keyboard when user taps on screen
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    internal func didTapUdpate(barleyPrice: String, cloverPrice: String, cornPrice: String, cottonPrice: String, wheatPrice: String) {
        
        viewModel.editPrices(barleyPrice: barleyPrice, cloverPrice: cloverPrice, cornPrice: cornPrice, cottonPrice: cottonPrice, wheatPrice: wheatPrice)
        
        navigationController?.popViewController(animated: true)
    }
    
    internal func didTapCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UI Functiions
    private func setupUI() {
        view.addSubview(editPricesView)
        editPricesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        editPricesView.backgroundColor = .systemBackground
        editPricesView.layer.cornerRadius = 16
        editPricesView.layer.borderWidth = 2
        editPricesView.layer.borderColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            editPricesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editPricesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editPricesView.widthAnchor.constraint(equalToConstant: 280),
            editPricesView.heightAnchor.constraint(equalToConstant: 520)
        ])
    }
}
