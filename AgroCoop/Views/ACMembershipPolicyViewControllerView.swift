//
//  ACMembershipPolicyViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 6/2/24.
//

import UIKit

class ACMembershipPolicyViewControllerView: UIView {
    
    //MARK: - Variable declaration
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.textAlignment = .justified
        
        return label
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        backgroundColor = UIColor(red: 0, green: 0.7294, blue: 0.1333, alpha: 0.4)
        layer.opacity = 0.6
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = 8
        
        addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.text = Constants.StaticTexts.articlesOfIncorporation
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
}
