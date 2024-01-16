//
//  ACPricesViewController.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

/// Controller that handles the view of the product prices 
final class ACPricesViewController: UIViewController {
    
    //MARK: - Variables declaration
    private let viewModel = ACPricesViewControllerViewModel()
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.separatorStyle = .singleLine
        tableview.rowHeight = 130
        return tableview
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    //MARK: - UI functions
    private func setupTableView() {
        tableView.register(ACPricesTableViewCell.self, forCellReuseIdentifier: Constants.TableViews.pricesTabelViewCellIdentifier)
        tableView.frame = view.bounds
        tableView.dataSource = viewModel
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Current Prices"
        navigationController?.navigationBar.tintColor = Constants.Colors.buttonTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        
    }

}



