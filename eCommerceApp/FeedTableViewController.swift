//
//  FeedTableViewController.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    var products:[Product]?
    
    struct Storyboard{
        static let feedProductCell = "FeedProductCell"
        static let showShoeSegue = "showShoeSegue"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "FEED"
        
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func fetchProducts(){
        products = Product.fetchProducts()
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let products = products{
            return products.count
        }else{
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell
        
        if let product = products{
            cell.product = product[indexPath.row]
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: FeedTableViewController.Storyboard.showShoeSegue, sender: indexPath)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == FeedTableViewController.Storyboard.showShoeSegue {
            if let shoeDetailTVC = segue.destination as? ProductDetailTVC {
                let selectedShoe = self.products?[(sender as! IndexPath).row]
                shoeDetailTVC.product = selectedShoe
            }
        }
    }
    
 }

