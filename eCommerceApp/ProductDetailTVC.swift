//
//  ProductDetailTVC.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class ProductDetailTVC: UITableViewController {
    
    var product:Product?
    
    @IBOutlet weak var shoeImagesHeaderView: ShoeImagesHeaderView!
    
    struct Storyboard{
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
        static let shoeImagesPageVC = "ShoeImagesPageViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product?.name
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.shoeImagesPageVC{
            if let imagesPageVC = segue.destination as? ShoeImagesPageViewController{
                imagesPageVC.images = product?.images
                imagesPageVC.pageViewControllerDelegate = shoeImagesHeaderView
            }
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // Configure the cell...
        if(indexPath.row == 0){
             let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = product
            cell.selectionStyle = .none
            return cell
        } else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
        }else if(indexPath.row == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.showProductDetailCell, for: indexPath)
            return cell
        }else{
            return UITableViewCell()
        }
    }
}



