//
//  CartItemCell.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/29/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var removeLabel: UILabel!
    
    var product:Product!{
        didSet{
           self.upateUI()
        }
    }
    
    func upateUI(){
        productImageView.image = product.images?.first
        productNameLabel.text = product.name
        priceLabel.text = "$\(product.price!)"
    }
    
}
