//
//  ViewController.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 7..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var mapView: UIView!
    
    let tapGesture = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // navigation Bar. 배경 (5, 150, 121)
        self.navBar.barTintColor = UIColor(red: 5.0/255.0, green: 150.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        // navigation Bar. 글씨 색 변경
        self.navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        // navigation Bar. 버튼 색 변경
        self.navBar.tintColor = UIColor.whiteColor()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.Portrait]    // 세로 고정
    }
    
    // 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch : UITouch = touches.first! as UITouch
        let selectedView: UIView! = touch.view
        
        switch selectedView {
            case self.mapView :
            
                print("Map tapped")
                //
                //let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapView") as! MapViewController
                
                //self.presentViewController(nextViewController, animated:true, completion:nil)
                //self.navigationController?.pushViewController(nextViewController, animated: true)
            
            default:
                print("other tapped")
        }
        
    
    }
    
}

