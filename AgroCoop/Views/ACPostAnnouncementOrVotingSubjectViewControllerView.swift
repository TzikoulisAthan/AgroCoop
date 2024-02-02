//
//  ACPostAnnouncementOrVotingSubjectViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 29/1/24.
//

import UIKit

//MARK: - Protocols
protocol ACPostAnnouncementOrVotingSubjectViewDelegate {
    /// Communicates to the viewModel defining the data that will be saved
    /// - Parameters:
    ///   - selectedSegmentIndex: the index of the segmentedController (Int)
    ///   - body: the content of the uitextview 
    func didSelectSegment(selectedSegmentIndex: Int, body: String)
}

class ACPostAnnouncementOrVotingSubjectViewControllerView: UIView {

    //MARK: - Variable declaration
    private let bodyTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .bezel
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 1
        textfield.placeholder = "New announcement"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let saveButton: ACMenuButton = {
        let button = ACMenuButton(title: "Post")
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    private let cancelButton: ACMenuButton = {
        let button = ACMenuButton(title: "Cancel")
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Announcement", "Voting Subject"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    var delegate: ACPostAnnouncementOrVotingSubjectViewDelegate?
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    
    @objc func didTapSaveButton() {
        guard let textBody = bodyTextField.text else {
            return
        }
        delegate?.didSelectSegment(selectedSegmentIndex: segmentedControl.selectedSegmentIndex, body: textBody)
        
    }
    
    
    //MARK: - UI FUnctions
    private func setupUI() {
        
        let views = [bodyTextField, saveButton, cancelButton, segmentedControl]
        
        for everyView in views {
            addSubview(everyView)
        }
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            segmentedControl.heightAnchor.constraint(equalToConstant: 60),
            
            bodyTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            bodyTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bodyTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bodyTextField.heightAnchor.constraint(equalToConstant: 150),
            
            saveButton.topAnchor.constraint(equalTo: bodyTextField.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 70),
            
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
}
