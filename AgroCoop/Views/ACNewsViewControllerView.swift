//
//  ACNewsViewControllerView.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 31/1/24.
//

import UIKit

class ACNewsViewControllerView: UIView {

    //MARK: - Variable declaration
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.rowHeight = 150
        tableview.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return tableview
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Functions
    private func setupUI() {
        
    }
}
