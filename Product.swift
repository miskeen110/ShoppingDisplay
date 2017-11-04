//
//  Product.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//


import UIKit
/*This class help to map and allocate data from rest api and use it nicely*/
class Product {
    
    var productName: String
    var productBrand: String
    var productImageUrl: String
    var productBarCode:String
    var productINCI: Array<String>

    
    init(productName: String, productBrand: String, productImageUrl: String, productBarCode:String, productINCI: Array<String>) {
        
        self.productName = productName
        self.productBrand = productBrand
        self.productImageUrl = productImageUrl
        self.productBarCode = productBarCode
        self.productINCI = productINCI
        
    }
    
}
