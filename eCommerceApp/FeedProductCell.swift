//
//  FeedProductCell.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class FeedProductCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    
    @IBOutlet var productNameLabel: UILabel!
    
    @IBOutlet var productPriceLabel: UILabel!
   
    var product: Product?{
        didSet{
            updateUI()
        }
    }
    
    
    func updateUI(){
        
        if let product = product {
            
            productImageView.image = product.images?.first
        
            productNameLabel.text = product.name
        
            productPriceLabel.text = "$\(String(describing: product.price!))"
        }
    }
}
