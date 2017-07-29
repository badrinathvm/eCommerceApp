//
//  ProductDetailCell.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet var productNameLabel: UILabel!
    
    @IBOutlet var productDetailLabel: UILabel!
    
    var product: Product?{
        didSet{
            productNameLabel.text = product?.name
            productDetailLabel.text = product?.description
        }
    }

}
