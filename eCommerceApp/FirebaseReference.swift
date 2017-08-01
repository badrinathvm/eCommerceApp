//
//  FirebaseReference.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/31/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage


enum DatabaseReferences{
    case root
    case users(uid:String)
    //case admin(name:String)
    
    //MARK: - public
    
    func reference() -> DatabaseReference{
        switch self{
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    private var rootRef: DatabaseReference{
        return Database.database().reference()
    }
    
    //calculate path 
    private var path:String{
        switch self{
        case .root:
                return ""
        case .users(let uid):
                return "users/\(uid)"
        //case .admin(let name):
                //return "users/admin/\(name)"
        }
        
    }
}

enum ImageStorageReferences{
    
    case root
    case profileImages
    
    func reference() -> StorageReference{
        switch self{
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    private var rootRef: StorageReference{
        return Storage.storage().reference()
    }
    
    private var path:String{
        switch self{
        case .root:
            return ""
        case .profileImages:
            return "profileImages"
        }
    }
}

class FirebaseReference{
    
}
