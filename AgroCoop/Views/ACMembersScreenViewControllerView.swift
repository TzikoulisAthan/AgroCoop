//
//  ACMembersScreenViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 23/1/24.
//

import UIKit

protocol ACMembersScreenDelegate {
    func didTapMenuButton(buttonName: String)
}

/// View for the ACMembersScreenViewController
final class ACMembersScreenViewControllerView: UIView {
    
    //MARK: - Variable declaration
    private let membersAnnouncementsButton = ACMenuButton(title: Constants.ButtonLabels.membersAnnouncementsButtonLabel)
    private let membersListButton = ACMenuButton(title: Constants.ButtonLabels.membersListButtonLabel)
    private let editPricesButton = ACMenuButton(title: Constants.ButtonLabels.editPricesButtonLabel)
    private let postAnnouncementButton = ACMenuButton(title: Constants.ButtonLabels.postAnnouncementButtonLabel)
    private let pricingPolicyButton = ACMenuButton(title: Constants.ButtonLabels.pricingPolicyButtonLabel)
    
    var delegate: ACMembersScreenDelegate?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Selectors
    @objc func pricingPolicyButtonTapped() {
        delegate?.didTapMenuButton(buttonName: Constants.ButtonLabels.pricingPolicyButtonLabel)
    }
    
    
    @objc func membersAnnouncementsButtonTapped() {
        delegate?.didTapMenuButton(buttonName: Constants.ButtonLabels.membersAnnouncementsButtonLabel)
    }
    
    
    @objc func membersListButtonTapped() {
        delegate?.didTapMenuButton(buttonName: Constants.ButtonLabels.membersListButtonLabel)
    }
    
    
    @objc func editPricesButtonTapped() {
        delegate?.didTapMenuButton(buttonName: Constants.ButtonLabels.editPricesButtonLabel)
    }
    
    
    @objc func postAnnouncementButtonTapped() {
        delegate?.didTapMenuButton(buttonName: Constants.ButtonLabels.postAnnouncementButtonLabel)
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        let views = [membersAnnouncementsButton, membersListButton, editPricesButton, postAnnouncementButton, pricingPolicyButton]
        
        for everyView in views {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        membersAnnouncementsButton.addTarget(self, action: #selector(membersAnnouncementsButtonTapped), for: .touchUpInside)
        membersListButton.addTarget(self, action: #selector(membersListButtonTapped), for: .touchUpInside)
        editPricesButton.addTarget(self, action: #selector(editPricesButtonTapped), for: .touchUpInside)
        postAnnouncementButton.addTarget(self, action: #selector(postAnnouncementButtonTapped), for: .touchUpInside)
        pricingPolicyButton.addTarget(self, action: #selector(pricingPolicyButtonTapped), for: .touchUpInside)
        
        
        let buttonPadding: CGFloat = 70
        
        NSLayoutConstraint.activate([
            pricingPolicyButton.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            pricingPolicyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            pricingPolicyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            pricingPolicyButton.heightAnchor.constraint(equalToConstant: 52),
            
            membersAnnouncementsButton.topAnchor.constraint(equalTo: pricingPolicyButton.bottomAnchor, constant: 30),
            membersAnnouncementsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            membersAnnouncementsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            membersAnnouncementsButton.heightAnchor.constraint(equalToConstant: 52),
            
            membersListButton.topAnchor.constraint(equalTo: membersAnnouncementsButton.bottomAnchor, constant: 30),
            membersListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            membersListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            membersListButton.heightAnchor.constraint(equalToConstant: 52),
            
            editPricesButton.topAnchor.constraint(equalTo: membersListButton.bottomAnchor, constant: 30),
            editPricesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            editPricesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            editPricesButton.heightAnchor.constraint(equalToConstant: 52),
            
            postAnnouncementButton.topAnchor.constraint(equalTo: editPricesButton.bottomAnchor, constant: 30),
            postAnnouncementButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: buttonPadding),
            postAnnouncementButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -buttonPadding),
            postAnnouncementButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    
}
