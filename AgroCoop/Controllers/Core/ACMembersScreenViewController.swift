//
//  ACMembersScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 14/1/24.
//

import UIKit
import FirebaseAuth

/// Controller that handles the view of the member's area of the app
final class ACMembersScreenViewController: UIViewController, ACMembersScreenDelegate {
    
    //MARK: - Variable declaration
    private let membersScreenView = ACMembersScreenViewControllerView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Welcome Member"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .done, target: self, action: #selector(doneButtonPressed))

        setupUI()
        
        membersScreenView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Selectors
    @objc func doneButtonPressed() {
           
           do {
               try FirebaseAuth.Auth.auth().signOut()
               navigationController?.popToRootViewController(animated: true)
               print("signing out")
           } catch {
               print("Error")
           }
       }
    
    
    //MARK: - Functions
    func didTapMenuButton(buttonName: String) {
        switch buttonName {
        case Constants.ButtonLabels.membersListButtonLabel:
            let vc = ACMembersListViewController()
            navigationController?.pushViewController(vc, animated: true)
        case Constants.ButtonLabels.pricingPolicyButtonLabel:
            let vc = ACMembershipPolicyViewController()
            navigationController?.pushViewController(vc, animated: true)
        case Constants.ButtonLabels.membersAnnouncementsButtonLabel:
            let vc = ACMembersAnnouncementsViewController()
            navigationController?.pushViewController(vc, animated: true)
        case Constants.ButtonLabels.postAnnouncementButtonLabel:
            let vc = ACPostAnnouncementOrVotingSubjectViewController()
            navigationController?.pushViewController(vc, animated: true)
        case Constants.ButtonLabels.editPricesButtonLabel:
            let vc = ACEditPricesViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    //MARK: - UI Functions
    private func setupUI() {
        view.addSubview(membersScreenView)
        membersScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            membersScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            membersScreenView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            membersScreenView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            membersScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
