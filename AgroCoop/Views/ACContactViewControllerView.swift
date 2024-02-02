//
//  ACContactViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 17/1/24.
//

import UIKit

/// The view for the contact info hamdled by ACContactViewController
final class ACContactViewControllerView: UIView {
    
    //MARK: - Variable declaration
    private let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 20
        return stackview
    }()
    
    private let logoImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: Constants.ImageStrings.logoImageString)
        return imageview
    }()
    
    private let phoneInfoView = ACContactFieldView(infoImage: "phone.circle", infoDetails: "6944629288")
    private let emailInfoView = ACContactFieldView(infoImage: "cloud", infoDetails: "www.in.gr")
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImage()
        configureStackView()
        addToStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI functions
    private func addToStackView() {
        stackView.addArrangedSubview(phoneInfoView)
        stackView.addArrangedSubview(emailInfoView)
    }
    
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        
        stackView.spacing = 20
        
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
    }
    
    private func configureImage() {
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 225),
            logoImageView.heightAnchor.constraint(equalToConstant: 225)
        ])
    }
    
}
