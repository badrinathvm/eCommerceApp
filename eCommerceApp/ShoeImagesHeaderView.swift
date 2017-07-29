//
//  ShoeImagesHeaderViewController.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/29/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class ShoeImagesHeaderView: UIView {

    @IBOutlet weak var pageControl : UIPageControl!

}

extension ShoeImagesHeaderView: ShoeImagesPageViewControllerDelegate{
    
    func setupPageController(numberOfPages:Int){
        
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index:Int){
        pageControl.currentPage = index
    }
}
