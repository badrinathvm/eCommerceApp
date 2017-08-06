//
//  AppDelegate.swift
//  eCommerceApp
//
//  Created by Badrinath on 7/28/17.
//  Copyright © 2017 Badrinath. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.configureAppearence()
        FirebaseApp.configure()
        
        DatabaseReferences.users(uid: "uid3abc").reference().setValue("Whiteboard")
        
        let adminValue = [
            "username" : "admin1",
            "uid" : "admin1"
        ]
        
        DatabaseReferences.users(uid: "admin").reference().setValue(adminValue)
        
        //DatabaseReferences.admin(name: "username").reference().setValue("admin")
        //DatabaseReferences.admin(name: "uid").reference().setValue("admin")
        
        let firImage = FirebaseImage(image: UIImage(named: "f1")!)
        
        firImage.saveProfileImage("shoe") { (error) in
            if ((error) != nil){
                print("Error Uploading Image \(String(describing: error))")
            }
        }
        
        return true
    }
    
    func configureAppearence(){
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

