//
//  ACMembersScreenLoginViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 22/1/24.
//

import UIKit

//MARK: - Protocol for interacting with login button
protocol ACMembersLoginDelegate {
    func didTapLogin(email: String, password: String)
}

/// View of the ACMembersScreenLoginViewController
final class ACMembersScreenLoginViewControllerView: UIView {
    
    //MARK: - Variable declaration
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Agricultural Cooperative of Platikabos"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 23)
        label.textAlignment = NSTextAlignment.center
        label.textColor = .black
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter your username"
        textfield.text = "admin@admin.com"
        textfield.textColor = Constants.Colors.buttonTitleColor
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.layer.borderColor = Constants.Colors.buttonFrameColor
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter your password"
        textfield.text = "123456"
        textfield.textColor = Constants.Colors.buttonTitleColor
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.isSecureTextEntry = true
        textfield.layer.borderColor = Constants.Colors.buttonFrameColor
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitleColor(Constants.Colors.buttonTitleColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Constants.Colors.buttonFrameColor
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var delegate: ACMembersLoginDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func loginButtonPressed() {
        
        //TODO: Implement textfield validation
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Invalid login credentials")
            return
        }
     
        delegate?.didTapLogin(email: email, password: password)
    }
    
    //MARK: - UI Methods
    private func setupUI() {
        let views = [welcomeLabel, emailTextField, passwordTextField, loginButton]
        
        for everyView in views {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 170),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 110),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
