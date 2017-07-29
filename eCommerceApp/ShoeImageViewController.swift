//
//  ShoeImageViewController.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/29/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class ShoeImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var image:UIImage?{
        didSet{
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.imageView.image = image
    }

    
}
