//
//  ACPricesTableViewCell.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

class ACPricesTableViewCell: UITableViewCell {
    
    //MARK: - Variable declaration
    private let productImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI functions
    func set(image: UIImage, product: String, price: String) {
        productImage.image = image
        productLabel.text = product
        priceLabel.text = price
    }
    
    
    private func setupUI() {
        let viewsArray = [productImage, productLabel, priceLabel]
        
        for everyView in viewsArray {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImage.widthAnchor.constraint(equalToConstant: 80),
            productImage.heightAnchor.constraint(equalToConstant: 80),
            
            productLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            productLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            productLabel.widthAnchor.constraint(equalToConstant: 80),
            
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
