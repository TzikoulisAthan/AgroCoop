//
//  ACPricesViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 28/1/24.
//

import UIKit

final class ACPricesViewControllerView: UIView, PricesViewModelDelegate {
    
    //MARK: - Variable declaration
    private var viewModel = ACPricesViewControllerViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.isHidden = true
        return spinner
    }()
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        tableview.rowHeight = 130
        tableview.isHidden = true
        tableview.alpha = 0
        return tableview
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        setupUI()
        spinner.startAnimating()
        
        viewModel.delegate = self
        
        Task {
            await viewModel.loadPricesFromDB()
            didLoadProducts()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func didLoadProducts() {
        spinner.stopAnimating()
        tableView.isHidden = false
        tableView.reloadData()
        UIView.animate(withDuration: 0.8) {
            self.tableView.alpha = 1
        }
    }
    
    
    private func setupTableView() {
        tableView.register(ACPricesTableViewCell.self, forCellReuseIdentifier: Constants.TableViews.pricesTabelViewCellIdentifier)
        
        tableView.dataSource = viewModel
    }
    
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
