//
//  ACVotingViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 9/2/24.
//

import UIKit

class ACVotingViewControllerView: UIView, ACVotingViewControllerViewModelDelegate {
  
    

    //MARK: - Variable declaration
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        tableview.rowHeight = 130
        return tableview
    }()
    
    private var viewModel = ACVotingViewControllerViewModel()
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        setupUI()
        viewModel.delegate = self
        
        Task {
            await viewModel.loadVotingSubjectsFromDB()
            didLoadVotingSubjects()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func didLoadVotingSubjects() {
        tableView.reloadData()
        UIView.animate(withDuration: 0.8) {
            self.tableView.alpha = 1
        }
    }
    
    //MARK: - UI Functions
    private func setupTableView() {
        tableView.register(ACVotingTableViewCell.self, forCellReuseIdentifier: Constants.TableViews.votingTableViewCellIdentifier)
        tableView.dataSource = viewModel 
    }
    
    private func setupUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//        layer.addSublayer(gradientLayer)
//        //layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
}
