//
//  ACEditPricesViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 23/1/24.
//

import UIKit


protocol ACEditPricesDelegate {
    func didTapUdpate(barleyPrice: String, cloverPrice: String, cornPrice: String, cottonPrice: String, wheatPrice: String)
    func didTapCancel()
}

final class ACEditPricesViewControllerView: UIView {
    
    //MARK: - Variable declaration
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Change product prices"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .white
        label.layer.backgroundColor = UIColor.systemGreen.cgColor
        label.layer.cornerRadius = 3
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowOpacity = 1
        return label
    }()
    private let barleyLabel: UILabel = {
        let label = UILabel()
        label.text = "Barley:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    private let cloverLabel: UILabel = {
        let label = UILabel()
        label.text = "Alfalfa:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    private let cornLabel: UILabel = {
        let label = UILabel()
        label.text = "Corn:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    private let cottonLabel: UILabel = {
        let label = UILabel()
        label.text = "Cotton:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    private let wheatLabel: UILabel = {
        let label = UILabel()
        label.text = "Wheat:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    
    private let barleyTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textAlignment = .right
        return textfield
    }()
    private let cloverTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textAlignment = .right
        return textfield
    }()
    private let cornTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textAlignment = .right
        return textfield
    }()
    private let cottonTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textAlignment = .right
        return textfield
    }()
    private let wheatTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textAlignment = .right
        return textfield
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return button
    }()
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let padding: CGFloat = 20
    
    var delegate: ACEditPricesDelegate?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selectors
    @objc func updateButtonTapped() {
        delegate?.didTapUdpate(barleyPrice: barleyTextField.text ?? "0", cloverPrice: cloverTextField.text ?? "0", cornPrice: cornTextField.text ?? "0",
                               cottonPrice: cottonTextField.text ?? "0", wheatPrice: wheatTextField.text ?? "0")
    }
    
    
    @objc func cancelButtonTapped() {
        delegate?.didTapCancel()
    }
    
    
    
    //MARK: - UI Functions
    private func setupUI() {
        
        let views = [titleLabel, barleyLabel, cloverLabel, cornLabel, cottonLabel, wheatLabel,
                     barleyTextField, cloverTextField, cornTextField, cottonTextField, wheatTextField, updateButton, cancelButton
        ]
        
        for everyView in views {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding*2),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            barleyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding*2),
            barleyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            barleyLabel.widthAnchor.constraint(equalToConstant: 140),
            
            barleyTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding*2),
            barleyTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            barleyTextField.widthAnchor.constraint(equalToConstant: 110),
            
            cloverLabel.topAnchor.constraint(equalTo: barleyLabel.bottomAnchor, constant: padding),
            cloverLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cloverLabel.widthAnchor.constraint(equalToConstant: 140),
            
            cloverTextField.topAnchor.constraint(equalTo: barleyTextField.bottomAnchor, constant: padding),
            cloverTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            cloverTextField.widthAnchor.constraint(equalToConstant: 110),
            
            cornLabel.topAnchor.constraint(equalTo: cloverLabel.bottomAnchor, constant: padding),
            cornLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cornLabel.widthAnchor.constraint(equalToConstant: 140),
            
            cornTextField.topAnchor.constraint(equalTo: cloverTextField.bottomAnchor, constant: padding),
            cornTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            cornTextField.widthAnchor.constraint(equalToConstant: 110),
            
            cottonLabel.topAnchor.constraint(equalTo: cornLabel.bottomAnchor, constant: padding),
            cottonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cottonLabel.widthAnchor.constraint(equalToConstant: 140),
            
            cottonTextField.topAnchor.constraint(equalTo: cornTextField.bottomAnchor, constant: padding),
            cottonTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            cottonTextField.widthAnchor.constraint(equalToConstant: 110),
            
            wheatLabel.topAnchor.constraint(equalTo: cottonLabel.bottomAnchor, constant: padding),
            wheatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            wheatLabel.widthAnchor.constraint(equalToConstant: 140),
            
            wheatTextField.topAnchor.constraint(equalTo: cottonTextField.bottomAnchor, constant: padding),
            wheatTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            wheatTextField.widthAnchor.constraint(equalToConstant: 110),
            
            updateButton.topAnchor.constraint(equalTo: wheatLabel.bottomAnchor, constant: (padding*2)),
            updateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 140),
            
            cancelButton.topAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: padding),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //layer.addSublayer(gradientLayer)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
