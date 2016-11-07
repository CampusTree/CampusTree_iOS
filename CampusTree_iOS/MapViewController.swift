//
//  MapViewController.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 7..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit


class MapViewController: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // navigation bar Setting
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 5.0/255.0, green: 150.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        // Force the device in LandscapeRight mode
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeRight.rawValue, forKey: "orientation")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // Force the device in LandscapeRight mode
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeRight.rawValue, forKey: "orientation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.LandscapeRight
    }
    
    // 가로 고정과 화면 회전 불가능을 위한 메소드
    /*override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.LandscapeRight]
    }
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.LandscapeRight
    }*/
    // 가로 고정과 화면 회전 불가능을 위한 메소드 끝.
    
    
    
    // Cancel 버튼 클릭시, MainView 로 이동
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        //self.navigationController?.popViewControllerAnimated(true)
    }
}


