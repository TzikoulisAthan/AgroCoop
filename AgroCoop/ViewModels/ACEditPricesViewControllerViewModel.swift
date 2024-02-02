//
//  ACEditPricesViewControllerViewModel.swift
//  AgroCoop
//
//  Created by Athanasios Tzikoulis on 28/1/24.
//

import UIKit
import FirebaseFirestore

class ACEditPricesViewControllerViewModel: NSObject {
    
    private let db = Firestore.firestore()
    
    internal func editPrices(barleyPrice: String, cloverPrice: String, cornPrice: String,
                            cottonPrice: String, wheatPrice: String) {
        let zeroPrice = ""
        
        if barleyPrice == zeroPrice {
            print("Barley price did not change")
        } else {
            self.db.collection(Constants.FstoreDB.productPricesCollection).document("Barley").updateData(["productPrice" : barleyPrice])
        }
        
        if cloverPrice == zeroPrice {
            print("Clover price did not change")
        }
        else {
            self.db.collection(Constants.FstoreDB.productPricesCollection).document("Clover").updateData(["productPrice" : cloverPrice])
        }
        
        if cornPrice == zeroPrice {
            print("Corn price did not change")
        } else {
            self.db.collection(Constants.FstoreDB.productPricesCollection).document("Corn").updateData(["productPrice" : cornPrice])
        }
        
        if cottonPrice == zeroPrice {
            print("Cotton price did not change")
        } else {
            self.db.collection(Constants.FstoreDB.productPricesCollection).document("Cotton").updateData(["productPrice" : cottonPrice])
        }
        
        if wheatPrice == zeroPrice {
            print("Wheat price did not change")
        } else {
            self.db.collection(Constants.FstoreDB.productPricesCollection).document("Wheat").updateData(["productPrice" : wheatPrice])
        }
        
    }
}
