//
//  ACNewsDetailsScreenViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 1/2/24.
//

import UIKit

class ACNewsDetailsScreenViewController: UIViewController {

    //MARK: - Variable declaration
    private let detailsView = ACNewsDetailsScreenViewControllerView()
    private let viewModel = ACNewsViewControllerViewModel()
    var articleTitle = String()
    var articleBody = String()
    
    
    //MARK: - Initializers
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
        
    }
    

    
    
    //MARK: - Functions
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    //MARK: - UI Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissVC))
        view.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        
        detailsView.frame = view.bounds
    }

}
