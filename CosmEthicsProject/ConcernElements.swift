//
//  ConcernElements.swift
//  CosmEthicsProject
//
//  Created by Miskeen Jatoi on 9/28/17.
//  Copyright © 2017 myorg. All rights reserved.
//

import UIKit
/*This class help to map and allocate data from rest api and use it nicely*/
class ConcernElements {

    var plasticAlert: Array<String>
    var highConcern: Array<String>
    
    init(plasticAlert: Array<String>, highConcern: Array<String>) {
        
        self.plasticAlert = plasticAlert
        self.highConcern = highConcern

    }
    
}
