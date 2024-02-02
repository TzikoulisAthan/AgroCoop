//
//  ACMembersAnnouncementsViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 28/1/24.
//

import UIKit

class ACMembersAnnouncementsViewControllerView: UIView, ACMembersAnnouncementsViewModelDelegate {

    //MARK: - Variable declaration
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        tableview.rowHeight = 130
        //tableview.isHidden = true
        //tableview.alpha = 0
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    private var viewModel = ACMembersAnnouncementsViewModel()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        setupUI()
        viewModel.delegate = self
        
        Task {
            await viewModel.loadAnnouncementsFromDB()
            didLoadAnnouncement()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func didLoadAnnouncement() {
        tableView.reloadData()
        UIView.animate(withDuration: 0.8) {
            self.tableView.alpha = 1
        }
    }
    
    //MARK: - UI Functions
    private func setupTableView() {
        tableView.register(ACMembersAnnouncementsTableViewCell.self, forCellReuseIdentifier: Constants.TableViews.membersAnnouncementsTableViewCellIdentifier)
        tableView.dataSource = viewModel 
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
