//
//  ACMembersAnnouncementsTableViewCell.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 28/1/24.
//

import UIKit

class ACMembersAnnouncementsTableViewCell: UITableViewCell {
    
    //MARK: - Variable declaration
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        
        return label
    }()
    
    private var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
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
    func set(date: String, body: String) {
        dateLabel.text = date
        bodyLabel.text = body
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        addSubview(dateLabel)
        addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            bodyLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
