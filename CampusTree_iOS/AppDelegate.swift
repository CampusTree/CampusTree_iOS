//
//  AppDelegate.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 7..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCQDoL1Cl24bLqAx5bat3uaTv7R63-plVU")
        return true
    }
    
    /*
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
        
        let viewController = self.window?.rootViewController
        
        if(viewController == nil){
            
            return UIInterfaceOrientationMask.All//All means all orientation
            
        }else if (viewController is MainViewController){
            
            return UIInterfaceOrientationMask.Portrait//This is sign in view controller that i only want to set this to portrait mode only
            
        }else if (viewController is MapViewController){
    
            return UIInterfaceOrientationMask.LandscapeRight//This is sign in view controller that i only want to set this to portrait mode only
            
        }else{
            
            return UIInterfaceOrientationMask.All
        }
        
        
        
    }
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow) -> Int {
        
        return checkOrientation(self.window?.rootViewController)// This is the custom function that u need to set your custom view to each orientation which u want to lock
        
    }
    func checkOrientation(viewController:UIViewController?)-> Int{
        
        if(viewController == nil){
            
            return Int(UIInterfaceOrientationMask.All.rawValue)//All means all orientation
            
        }else if (viewController is MainViewController){
            
            return Int(UIInterfaceOrientationMask.Portrait.rawValue)//This is sign in view controller that i only want to set this to portrait mode only
            
        }else if (viewController is MapViewController){
            
            return Int(UIInterfaceOrientationMask.LandscapeRight.rawValue)//This is sign in view controller that i only want to set this to portrait mode only
            
        }else{
            
            return checkOrientation(viewController!.presentedViewController)
        }
    }*/

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

