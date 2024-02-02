//
//  ACNewsDetailsScreenViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 1/2/24.
//

import UIKit

class ACNewsDetailsScreenViewControllerView: UIView {

    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
//    var articleTitle = String()
//    var articleContent = String()
    private let articleImageView = UIImageView()
    
    private let articleTitleLabel = UILabel()
    private let articleContentLabel = UILabel()
    
    var newsViewModel = ACNewsViewControllerViewModel()
    var newsView = ACNewsViewControllerView()
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    func configure(with title: String, body: String) {
        articleTitleLabel.text = title
        articleContentLabel.text = body
    }
    
    
    
    //MARK: - UI Functions
    func configureUI() {
        configureArticleTitle()
        configureArticleContent()
    }
    
    
    private func configureExitButton() {
        
    }
    
    func configureArticleTitle() {
        addSubview(articleTitleLabel)
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //articleTitleLabel.text = articleTitle
        articleTitleLabel.numberOfLines = 0
        articleTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            articleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            articleTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    
    func configureArticleContent() {
        addSubview(articleContentLabel)
        articleContentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //articleContentLabel.text = articleContent
        articleContentLabel.numberOfLines = 0
        articleContentLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        articleContentLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            articleContentLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 15),
            articleContentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            articleContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    
}
