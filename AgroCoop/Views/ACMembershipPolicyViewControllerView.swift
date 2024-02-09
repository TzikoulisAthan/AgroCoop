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
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        return sv
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
        
        addSubview(scrollView)
        scrollView.addSubview(contentLabel)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.text = Constants.StaticTexts.articlesOfIncorporation
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            
            contentLabel.topAnchor.constraint(equalTo:      scrollView.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo:  scrollView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo:   scrollView.bottomAnchor),
            
            contentLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        

    }
}


