//
//  ACPricesViewControllerViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit

class ACPricesViewControllerViewModel: NSObject {
    
}


extension ACPricesViewControllerViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.TableViews.pricesTabelViewCellIdentifier,
            for: indexPath) as! ACPricesTableViewCell
        
        cell.set(image: UIImage(named: "barley-plant")!, product: "Barley", price: "0,17")
        
        return cell
    }
    
    
}
