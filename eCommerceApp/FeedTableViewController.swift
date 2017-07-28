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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "FEED"
        
        fetchProducts()
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
        }

        // Configure the cell...

        return cell
    }
    

}
