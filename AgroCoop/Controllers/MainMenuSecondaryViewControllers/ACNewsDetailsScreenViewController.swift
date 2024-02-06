//
//  ACNewsDetailsScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 1/2/24.
//

import UIKit

class ACNewsDetailsScreenViewController: UIViewController, ACNewsDetailsScreenViewControllerViewDelegate {


    //MARK: - Variable declaration
    private let detailsView = ACNewsDetailsScreenViewControllerView()
    private let viewModel = ACNewsViewControllerViewModel()
    var articleTitle = String()
    var articleBody = String()
    
    
    //MARK: - Initializers
    /// Data from the didSelectArticle method are passed to the viewcontroller responsible for handlling
    /// the view. The data are then passed to the view via the configure funtion
    /// - Parameters:
    ///   - title: title of the article in the row of the tableview
    ///   - body: body of the article in the row of the tableview
    init(title: String, body: String) {
        super.init(nibName: nil, bundle: nil)
        
        detailsView.configure(with: title, body: body)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        detailsView.delegate = self
    }
    

    
    
    //MARK: - Functions
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func didPressExitButton() {
        dismiss(animated: true)

    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissVC))
        view.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
