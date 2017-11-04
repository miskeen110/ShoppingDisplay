//
//  ProductCell.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var alertOrSafe: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var safeAlertIcon: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /******
            
            This function is doing the placement of 
            data into cell View which will be displayed 
            to end user. Checking out it contains 
            plastic or high concern element or its safe.
 
                                                        *****/
    func bind(_ product: Product, concernElementsValidation:ConcernElements) {
        
        if product.productImageUrl.isEmpty == false {
            let imageUrl:URL = URL(string: product.productImageUrl)!
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let image = UIImage(data: imageData as Data)
            productImage.image = image
        }

        productName.text = product.productName
        productBrand.text = product.productBrand
        
        for plastic in concernElementsValidation.plasticAlert {
        if product.productINCI.contains(plastic){
            alertOrSafe.text = "Plastic Alert"
            safeAlertIcon.image = UIImage(named:"alert.png")
            break
            }
        }
        
        for highConcern in concernElementsValidation.highConcern {
            if product.productINCI.contains(highConcern){
                commentLabel.text = "HighConcern"
                safeAlertIcon.image = UIImage(named:"alert.png")
                break
            }
        }
        
        if (commentLabel.text != "HighConcern")  && (alertOrSafe.text != "Plastic Alert"){
            alertOrSafe.text = "SAFE"
            safeAlertIcon.image = UIImage(named:"safe.png")
        }
    }

}
