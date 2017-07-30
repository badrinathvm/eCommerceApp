//
//  ShoppingBagTVC.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/29/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class ShoppingBagTVC: UITableViewController {
    
    var products:[Product]?
    
    
    struct Storyboard{
        static let numberOfItemsCell = "NumberOfItemsCell"
        static let cartItemcell = "CartItemCell"
        static let totalCell = "TotalCell"
        static let checkoutButtonCell = "CheckoutButtonCell"
        static let taxCell = "TaxCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Code for dynamic tableview height
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.fetchProductData()
    }

    
    func fetchProductData(){
        products = Product.fetchProducts()
        tableView.reloadData()
    }
    
}

//MARK: - UITableViewDataSource

extension ShoppingBagTVC  {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let product = products{
            return product.count + 4
        }else{
            return 1
        }
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // In case of no items added to cart 
        
        guard let product = products else{
             let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
           cell.numberOfItemsLabel.text = "0 ITEMS"
           return cell
        }
        
        //print(product.count)
    
        if (indexPath.row == 0){
            //no of items cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text =  (product.count == 1) ? "\(product.count) ITEM" : "\(product.count) ITEMS"
            
            return cell
            
        }else if (indexPath.row == product.count + 1){
            // tax cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.taxCell, for: indexPath) as! TaxCell
            
    
            return cell
            
        } else if (indexPath.row == product.count + 2){
            //total cell
        
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.totalCell, for: indexPath) as! TotalCell
            
            return cell
            
        } else if ( indexPath.row == product.count + 3){
            //checkout cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.checkoutButtonCell, for: indexPath) as! CheckoutButtonCell
            
            return cell

        }else{
            
            //cart item cell
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTVC.Storyboard.cartItemcell, for: indexPath) as! CartItemCell
            print(indexPath.row)
            cell.product = product[indexPath.row - 1]
            return cell
        }
     
    }
    

}
