//
//  BuyButtonCell.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet var buyButton: UIButton!

    var product:Product!{
        didSet{
            buyButton.setTitle("BUY $\(product.price!)", for: [])
        }
    }
    
}
