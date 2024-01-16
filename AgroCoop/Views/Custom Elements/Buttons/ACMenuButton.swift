//
//  ACMenuButton.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit

class ACMenuButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(title: String, type: UIButton.ButtonType = .system) {
//        super.init(frame: .zero)
       self.init(type: type)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = CGColor(red: 0, green: 0.7294, blue: 0.1333, alpha: 1.0)
        layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        setTitleColor(Constants.Colors.buttonTitleColor, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
}
