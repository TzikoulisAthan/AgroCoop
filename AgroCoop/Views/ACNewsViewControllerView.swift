//
//  ACNewsViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import UIKit

protocol ACNewsViewControllerViewDelegate {
    func presentDetailViewController(_ viewController: UIViewController)
}

final class ACNewsViewControllerView: UIView, ACNewsViewControllerViewModelViewDelegate {
   
    //MARK: - Variable declaration
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.rowHeight = 150
        return tableview
    }()
    
    var viewModel = ACNewsViewControllerViewModel()
    var delegate: ACNewsViewControllerViewDelegate?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        viewModel.delegate = self
        didLoadNews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    func didLoadNews() {
        viewModel.getNews()
        tableView.reloadData()
    }
    
    func didSelectArticle(articleTitle: String, articleBody: String) {
        let detailVC = ACNewsDetailsScreenViewController(title: articleTitle, body: articleBody)
        delegate?.presentDetailViewController(detailVC)
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        addSubview(tableView)
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ACNewsTableViewCell.self, forCellReuseIdentifier: Constants.TableViews.newsTableViewCellIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
