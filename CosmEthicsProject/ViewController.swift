//
//  ViewController.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//

import UIKit
import Alamofire


    /* This is the main view controller where every thing
       called and handled as well as displayed*/
class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    /*These two variables are calling the REST API Data into variables and validation
     is not needed but to be on the safe side i did it.*/
    
    fileprivate var products = RESTAPI().generateDataFromAPI()
    fileprivate var productValidation = [Product]()
    
    fileprivate var concernElements = RESTAPI().generateHighConcernAPI()
    fileprivate var concernElementsValidation = [ConcernElements]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productValidation = products
        concernElementsValidation = concernElements

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*This function depends on how the cell and data looks
          so i have passed the data to cell class where variables are defined and
          it can be done here as well easily. But recommeneded way is like i have 
          done now*/
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ProductCell
            cell.bind(productValidation[(indexPath as NSIndexPath).row],concernElementsValidation: concernElementsValidation[0])
            return cell
   
    }
}

