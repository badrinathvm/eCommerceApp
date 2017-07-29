//
//  ShoeImagesPageViewController.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/29/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

protocol ShoeImagesPageViewControllerDelegate:class{
    
    func setupPageController(numberOfPages:Int)
    func turnPageController(to index:Int)
    
}

class ShoeImagesPageViewController: UIPageViewController {

    var images:[UIImage]? = Product.fetchProducts().first?.images
    
    weak var pageViewControllerDelegate: ShoeImagesPageViewControllerDelegate?
    
    struct Storyboard{
        static let shoeImageViewController = "ShoeImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var controllers = [UIViewController]()
        
        if let images = self.images{
            for image in images{
                let shoeImageVC = storyboard.instantiateViewController(withIdentifier: ShoeImagesPageViewController.Storyboard.shoeImageViewController)
                
                controllers.append(shoeImageVC)
            }
        }
        
        //Let delgate know how many pages are there
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       automaticallyAdjustsScrollViewInsets = false
        
       dataSource = self
       delegate = self
        
       self.turnToPage(index: 0)
    
    }
    
    func turnToPage(index:Int){
        
        let controller = controllers[index]
        
        //get the direction
        var direction =  UIPageViewControllerNavigationDirection.forward
        
        //check if the current view controlelr is first , if yes get the index
        if let currentVC = viewControllers?.first{
            
            let currentIndex = controllers.index(of: currentVC)!
            
            if (currentIndex > index) {
                direction = .reverse
            }
            
        }
        
        self.configureDisplaying(viewController:controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
        
    }
    
    
    func configureDisplaying(viewController:UIViewController){
        
        //enumerate over view controllers 
        // check viewcontroller is in this vc
        
        for(index, vc) in controllers.enumerated(){
            
            if viewController === vc {
                
                if let shoeImageVC = viewController as? ShoeImageViewController{
                    
                    shoeImageVC.image = self.images?[index]
                    
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
            
        }
        
    }
}

extension ShoeImagesPageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //check the index of current view controller 
        if let index = controllers.index(of: viewController){
            //return the previous one of it
            if (index > 0){
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //last but one
        if let index = controllers.index(of: viewController){
            
            if( index < controllers.count - 1){
                return controllers[index + 1]
            }
        }
    
        return controllers.first
    }
}


extension ShoeImagesPageViewController : UIPageViewControllerDelegate{
    
    //after transition control comes over here , so we need to display the view over here
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.configureDisplaying(viewController: pendingViewControllers.first as! ShoeImageViewController)
    
    }
    
    
    //if the animation transition is not complete, then display previous view controller
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if (!completed) {
            self.configureDisplaying(viewController: previousViewControllers.first as! ShoeImageViewController)
        }
    }
}
