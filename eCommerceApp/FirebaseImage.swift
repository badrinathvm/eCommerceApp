//
//  FirebaseImage.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/31/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class FirebaseImage{
    
    var image: UIImage
    var download: URL?
    var downloadURLString: String!
    var ref: StorageReference!
    
    init(image: UIImage){
        self.image = image
    }
    
    func saveProfileImage(_ userUID:String, _ completion:@escaping (Error?) -> Void){
        
        let resizedImage = image.resize()
        let imageData = UIImageJPEGRepresentation(resizedImage, 0.9)
        
        //get the reference 
        ref = ImageStorageReferences.profileImages.reference().child(userUID)
        downloadURLString = ref.description
        
        //save the data to the reference
        ref.putData(imageData!, metadata: nil) { (metaData, error) in
            completion(error)
        }
    }
}

private extension UIImage{
    
    func resize() -> UIImage{
        
        //pixels
        let height: CGFloat = 1000.0
        let ratio = self.size.width / self.size.height
        let width = height * ratio
        
        let newSize = CGSize(width: width, height: height)
        let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
        
        //context - canvas
        UIGraphicsBeginImageContext(newSize)
        
        //draw the newly sized image on the canvas
        self.draw(in: newRectangle)
        
        //get the new size image in to a new variable 
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //close the canvas
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
}

