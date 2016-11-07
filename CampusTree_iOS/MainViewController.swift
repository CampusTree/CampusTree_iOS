//
//  ViewController.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 7..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var mapView: UIView!
    
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        forceOrientation()
    }
    
    override func viewDidAppear(animated: Bool) {
        forceOrientation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func setNavBar() {
        // navigation bar Setting
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 5.0/255.0, green: 150.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    func forceOrientation() {
        // Force the device in portrait mode
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
    }
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    // 세로 고정과 화면 회전 불가능을 위한 메소드
    /*
    override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.Portrait]
    }
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.Portrait
    }*/
    // 세로 고정과 화면 회전 불가능을 위한 메소드 끝
    

    // 메뉴 선택시 리스너
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch : UITouch = touches.first! as UITouch
        let selectedView: UIView! = touch.view
        
        switch selectedView {
        case self.mapView :
            
            // 지도 클릭시, MapView로 이동
            print("Map tapped")
            
            //let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapView") as! MapViewController
            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewNavController") as! UINavigationController
            self.presentViewController(nextViewController, animated:true, completion:nil)
            //self.navigationController?.pushViewController(nextViewController, animated: true)
            
        default:
            print("Other tapped")
        }
        
        
    }
    
}



