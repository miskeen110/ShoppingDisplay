//
//  Product.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//

import UIKit

@IBDesignable
class ImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
