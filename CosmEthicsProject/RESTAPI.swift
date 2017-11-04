//
//  RESTAPI.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//

import UIKit
import Alamofire

    /*This class map the REST API data into classes like Product and Concern
      these functions are called in the view controller after tableview is
      defined*/

class RESTAPI {
    
    var products = [Product]()
    var concernElementsInProducts = [ConcernElements]()
    
    func generateDataFromAPI() -> [Product] {
       
        let prouductParamters = ["3605521556028","0716237090089","7702018868902"]

        for productCodes in prouductParamters {
        Alamofire.request("http://42.cosmethics.com/p/\(productCodes)").responseJSON { response in
            
            if let json = response.result.value as! NSDictionary?{
                 let productName = json["name"]
                 let productBrand = json["brand"]
                 let productImageUrl = json["image"]
                 let productBarCode = json["barcode"]
                 let productINCI = json["INCI"]
                
                let productDetails = Product(productName: productName as! String, productBrand:productBrand as! String, productImageUrl:productImageUrl as! String, productBarCode: productBarCode as! String,
                                             productINCI:productINCI as! Array<String>)
                
                self.products.append(productDetails)
                
            }
            else
            {
                print("Did not receive json")
            }
          }
        }
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        } while self.products.isEmpty

        return self.products
   
    }
    
    
    func generateHighConcernAPI() -> [ConcernElements] {
            Alamofire.request("http://42.cosmethics.com/p/alerts").responseJSON { response in
                
                if let json = response.result.value as! NSDictionary?{

                    let plasticAlert = json["Plastics Alert!"] as! Array<String>
                    print (plasticAlert)
                    
                    let highConcern = json["High Concern!"] as! Array<String>

                    let elementsForConcern = ConcernElements(plasticAlert:plasticAlert, highConcern:highConcern)
                    
                    self.concernElementsInProducts.append(elementsForConcern)
                    
                }
                else
                {
                    print("Did not receive json")
                }
            }
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        } while self.concernElementsInProducts.isEmpty
        
        return self.concernElementsInProducts
    }
    
}
    
