//
//  ACContactFieldView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 17/1/24.
//

import UIKit

/// The view of each field presented in the contact info screen
final class ACContactFieldView: UIView {
    
    //MARK: - Variable declaration
    private let stackView: UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .horizontal
        stakcView.distribution = .fillEqually
        stakcView.spacing = 5
        return stakcView
    }()
    
    private var infoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private var infoTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Arial", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()
    
    private var infoDetails: UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.textAlignment = .right
        label.dataDetectorTypes = .all
        label.backgroundColor = .none
        label.font = UIFont(name: "Arial", size: 18)
        return label
    }()
    
    private let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 1)
    
    //MARK: - Initialization
    init(infoImage: String, infoDetails: String) {
        self.infoImage.image = UIImage(systemName: infoImage)
        self.infoDetails.text = infoDetails
        super.init(frame: .zero)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI functions
    private func configure() {
        setupUI()
        setupStackView()
    }
    
    
    private func setupStackView() {
        //stackView.addArrangedSubview(infoTitle)
        stackView.addArrangedSubview(infoImage)
        stackView.addArrangedSubview(infoDetails)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupUI() {
        addSubview(infoTitle)
        addSubview(infoDetails)
        addSubview(stackView)

        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        infoDetails.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemGray2
        layer.borderColor = .none
        layer.cornerRadius = 14
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        infoDetails.isEditable = false
        infoDetails.textAlignment = .right
        infoDetails.dataDetectorTypes = .all
        infoDetails.backgroundColor = .none
        infoDetails.font = UIFont(name: "Arial", size: 18)
        
    }
}
