//
//  ACPricesViewControllerViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 15/1/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore


protocol PricesViewModelDelegate {
    /// Protocol-delegate communication in order
    /// to reload tableview in ACPricesViewController
    /// once loadedProducts array is populated with Firestore data
    func didLoadProducts()
}


/// The data source for the ACPricesViewController.
class ACPricesViewControllerViewModel: NSObject {
    
    
    let db = Firestore.firestore()
    
    private let productsArray = ["Cotton", "Wheat", "Corn", "Barley", "Clover"]
    
    private var loadedProducts = [ProductPricesModel]()
    
    var delegate: PricesViewModelDelegate?
    
    /// Load product prices from firestore database
    func loadPricesFromDB() async {
        loadedProducts = []
        
        for product in productsArray {
            let pricesRef = db.collection(Constants.FstoreDB.productPricesCollection).document(product)
       
            do {
                let snapshot = try await pricesRef.getDocument()
                
                let data = snapshot.data()
                guard let name = data!["productName"] as? String else { return }
                guard let price = data!["productPrice"] as? String else { return }
                let newProduct = ProductPricesModel(productName: name, productPrice: price)
                loadedProducts.append(newProduct)
                print(loadedProducts)
            } catch {
                print("Error reading document")
            }
        }
    }
    
}


extension ACPricesViewControllerViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.TableViews.pricesTabelViewCellIdentifier,
            for: indexPath) as! ACPricesTableViewCell
        
        let product = loadedProducts[indexPath.row]
        cell.set(image: UIImage(named: product.productName)!, product: product.productName, price: product.productPrice)
        
        return cell
    }
    
    
}
