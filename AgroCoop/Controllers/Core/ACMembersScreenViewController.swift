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
        
        // Create a button in navigation controller that pops a menu
        let button = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"))
        button.menu = addMenu()
        navigationItem.rightBarButtonItem = button
        
        setupUI()
        
        membersScreenView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = false
    }

    
    //MARK: - Functions
    func didTapMenuButton(buttonName: String) {
        switch buttonName {
        case Constants.ButtonLabels.membersListButtonLabel:
            let vc = ACMembersListViewController()
            navigationController?.pushViewController(vc, animated: true)
        case Constants.ButtonLabels.pricingPolicyButtonLabel:
            let vc = ACMembershipPolicyViewController()
            vc.navigationController?.navigationBar.prefersLargeTitles = false
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
    
    
    /// Function creates a dropdown menu
    /// - Returns: Menu containing menuitems. Each menuitem has its own funcionality
    private func addMenu() -> UIMenu {
        let menuItems = UIMenu(title:"", options: .displayInline, children: [
            
            UIAction(title: "Setting", image: UIImage(systemName: "gearshape"), handler: { action in
                
                let vc = ACEditPricesViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }),
            
            UIAction(title: "Log out", image: UIImage(systemName: "pip.exit"), handler: { action in
                
                do {
                    try FirebaseAuth.Auth.auth().signOut()
                    self.navigationController?.popToRootViewController(animated: true)
                    print("signing out")
                } catch {
                    print("Error")
                }
                
            }),
            
        ])
        
        return menuItems
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
