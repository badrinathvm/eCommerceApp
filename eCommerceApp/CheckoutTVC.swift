//
//  CheckoutTVC.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/30/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit

class CheckoutTVC: UITableViewController {
    
    
    struct Storyboard{
        static let billingInfoCell = "NumberOfItemsCell"
        static let totalCell = "TotalCell"
        static let userDetailsCell = "UserDetailsCell"
        static let taxCell = "TaxCell"
        static let submitOrderCell = "SubmitOrderCell"
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }


}


extension CheckoutTVC {
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVC.Storyboard.billingInfoCell, for: indexPath) as! NumberOfItemsCell
            
            cell.numberOfItemsLabel.text = "BILLING INFORMATION"
            
            return cell
        } else if ( indexPath.row == 1){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVC.Storyboard.userDetailsCell, for: indexPath) as! UserDetailsCell
            
            return cell
        } else if ( indexPath.row == 2 ){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVC.Storyboard.taxCell, for: indexPath)
            
            return cell
        }else if (indexPath.row == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVC.Storyboard.totalCell, for: indexPath)
            
            return cell
        }else if (indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVC.Storyboard.submitOrderCell, for: indexPath)
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    

}
