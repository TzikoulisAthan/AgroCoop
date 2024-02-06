//
//  ACNewsDetailsScreenViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 1/2/24.
//

import UIKit

protocol ACNewsDetailsScreenViewControllerViewDelegate {
    func didPressExitButton()
}

class ACNewsDetailsScreenViewControllerView: UIView {

    private let exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = UIColor.gray
        return button
    }()

    private let articleImageView = UIImageView()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.layer.shadowColor = UIColor.black.cgColor // Shadow color
        label.layer.shadowOpacity = 0.5 // Shadow opacity
        label.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow offset
        label.layer.shadowRadius = 4 // Shadow radius
        return label
    }()
    private let articleContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var newsViewModel = ACNewsViewControllerViewModel()
    var newsView = ACNewsViewControllerView()
    
    var delegate: ACNewsDetailsScreenViewControllerViewDelegate?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selectors
    @objc func didTapExitButton() {
        delegate?.didPressExitButton()
    }
    
    
    //MARK: - Functions
    func configure(with title: String, body: String) {
        articleTitleLabel.text = title
        articleContentLabel.text = body
    }
    
    
    
    //MARK: - UI Functions
    func configureUI() {
        configureExitButton()
        configureArticleTitle()
        configureArticleContent()
    }
    
    
    private func configureExitButton() {
        addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        exitButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 14),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            exitButton.widthAnchor.constraint(equalToConstant: 17),
            exitButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    func configureArticleTitle() {
        addSubview(articleTitleLabel)
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 20),
            articleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            articleTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            articleTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureArticleContent() {
        addSubview(articleContentLabel)
        articleContentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            articleContentLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 15),
            articleContentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            articleContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            articleContentLabel.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}
