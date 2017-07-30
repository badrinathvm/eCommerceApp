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
        static let suggestionCell = "SuggestionTableViewCell"
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


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.shoeImagesPageVC{
            if let imagesPageVC = segue.destination as? ShoeImagesPageViewController{
                imagesPageVC.images = product?.images
                imagesPageVC.pageViewControllerDelegate = shoeImagesHeaderView
            }
        }
    }

}


// MARK: - Table view data source

extension ProductDetailTVC{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
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
            
            //product Suggestion Cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 3){
            return tableView.bounds.width + 68
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
    
    //MARK: - UITableView Delegate Method
    
    //is called whenever table is going to display the cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == 3){
            if let cell = cell as? SuggestionTableViewCell{
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
}

//MARK:- UICollectionViewDataSource

extension ProductDetailTVC: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCollectionViewCell", for: indexPath) as! SuggestionCollectionViewCell
        
        //TODO: - set real data for products 
        
        let product = Product.fetchProducts()
        cell.image = product[indexPath.item].images?.first
        return cell
    }
    
}

//MARK :- UICollectionViewDelgate

extension ProductDetailTVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 5.0
            layout.minimumLineSpacing = 2.5
            
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            
            return CGSize(width: itemWidth, height: itemWidth)
            
        }
        return CGSize.zero
    }
}




