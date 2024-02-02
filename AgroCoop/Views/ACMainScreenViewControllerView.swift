//
//  ACMainScreenViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 16/1/24.
//

import UIKit
import SafariServices

/// Use protocol - delegate communication with viewcontroller in order to pass
/// the information of which button is pressed.
protocol ACMainScreenViewControllerViewDelegate {
    func didTapButton(buttonLabel: String)
}

/// The view of the main menu screen handled by ACMainScreenViewController
class ACMainScreenViewControllerView: UIView {
    
    //MARK: - Variable declarations
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.ImageStrings.logoImageString)
        
        return image
    }()
    
    private let motoLabel: UILabel = {
        let label = UILabel()
        label.text = "100 years of excellence and progress"
        label.font = UIFont(name: "Arial", size: 18)
        return label
    }()
    
    private let buttonPadding: CGFloat = 70
    
    private let pricesButton = ACMenuButton(title: Constants.ButtonLabels.priceButtonLabel)
    private let contactButton = ACMenuButton(title: Constants.ButtonLabels.contactButtonLabel)
    private let newsButton = ACMenuButton(title: Constants.ButtonLabels.newsButtonLabel)
    private let entopioButton = ACMenuButton(title: Constants.ButtonLabels.entopioButtonLabel)
    
    var delegate: ACMainScreenViewControllerViewDelegate?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selector functions
    @objc private func pricesButtonTapped() {
        delegate?.didTapButton(buttonLabel: Constants.ButtonLabels.priceButtonLabel)
    }
    
    @objc private func contactButtonTapped() {
        delegate?.didTapButton(buttonLabel: Constants.ButtonLabels.contactButtonLabel)
    }
    
    @objc private func newsButtonTapped() {
        delegate?.didTapButton(buttonLabel: Constants.ButtonLabels.newsButtonLabel)
    }
    
    @objc private func entopioButtonTapped() {
        delegate?.didTapButton(buttonLabel: Constants.ButtonLabels.entopioButtonLabel)
    }
    
    
    //MARK: - UI functions
    private func setupUI() {
        
        let viewsArray = [logoImage, motoLabel, pricesButton, contactButton, newsButton, entopioButton]
        
        for everyView in viewsArray {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        pricesButton.addTarget(self, action: #selector(pricesButtonTapped), for: .touchUpInside)
        contactButton.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
        newsButton.addTarget(self, action: #selector(newsButtonTapped), for: .touchUpInside)
        entopioButton.addTarget(self, action: #selector(entopioButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 225),
            logoImage.heightAnchor.constraint(equalToConstant: 225),
            
            motoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 12),
            motoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            motoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            pricesButton.topAnchor.constraint(equalTo: motoLabel.bottomAnchor, constant: 30),
            pricesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            pricesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            pricesButton.heightAnchor.constraint(equalToConstant: 52),
            
            contactButton.topAnchor.constraint(equalTo: pricesButton.bottomAnchor, constant: 30),
            contactButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            contactButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            contactButton.heightAnchor.constraint(equalToConstant: 52),
            
            newsButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 30),
            newsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            newsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            newsButton.heightAnchor.constraint(equalToConstant: 52),
            
            entopioButton.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 30),
            entopioButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            entopioButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            entopioButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}



