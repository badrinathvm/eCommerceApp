//
//  SuggestionCollectionViewCell.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/30/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?{
        didSet{
            imageView.image = image
            //when collection view needs to do layout of all of it's images we will use
            setNeedsLayout()
        }
    }
    
    
}
