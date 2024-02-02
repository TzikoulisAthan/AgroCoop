//
//  ACNewsTableViewCell.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import UIKit

class ACNewsTableViewCell: UITableViewCell {
    
    //MARK: - Variabel declaration
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textColor = .systemTeal
        label.minimumScaleFactor = 0.75
        label.lineBreakMode = .byCharWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func set(title: String, body: String) {
        self.titleLabel.text = title
        self.bodyLabel.text = body
    }
    
    //MARK: - UI Functions
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
