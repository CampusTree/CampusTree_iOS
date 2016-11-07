//
//  MapViewController.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 7..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit
import GoogleMaps


class MapViewController: UIViewController, UINavigationControllerDelegate, UISearchBarDelegate, GMSMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createSearchBar()
        setNavBar()
        forceOrientation()
        
    
        /*
        let camera = GMSCameraPosition.cameraWithLatitude(36.837433,
                                                          longitude: 127.168721, zoom: 17)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.settings.zoomGestures = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(36.837433, 127.168721)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
        let circleCenter : CLLocationCoordinate2D  = CLLocationCoordinate2DMake(36.837433, 127.168721);
        let circ = GMSCircle(position: circleCenter, radius: 50)
        circ.fillColor = UIColor(red: 0.0, green: 0.7, blue: 0, alpha: 0.1)
        circ.strokeColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.5)
        circ.strokeWidth = 1;
        circ.map = mapView*/
        
    }
    override func viewDidAppear(animated: Bool) {
        forceOrientation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func loadView() {
        var camera = GMSCameraPosition.cameraWithLatitude(36.837433, longitude:127.168721, zoom:17)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.delegate = self
        self.view = mapView
    }
    func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        
        let lat = coordinate.latitude
        let lng = coordinate.longitude
        
        let camera = GMSCameraPosition.cameraWithLatitude(lat, longitude: lng, zoom:17)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.delegate = self
        self.view = mapView
        
        let circleCenter : CLLocationCoordinate2D  = CLLocationCoordinate2DMake(lat, lng);
        let circ = GMSCircle(position: circleCenter, radius: 50)
        circ.fillColor = UIColor(red: 0.0, green: 0.7, blue: 0, alpha: 0.1)
        circ.strokeColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.5)
        circ.strokeWidth = 1;
        circ.map = mapView
        
        print("I tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    /* 클릭시 위치 찾기
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        let myFirstButton = UIButton()
        myFirstButton.setTitle("✸", forState: .Normal)
        myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myFirstButton.frame = CGRectMake(15, -50, 300, 500)
        myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myFirstButton)
        return true
    }*/
    
    
    func createSearchBar() {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "검색할 수목 이름을 입력하세요."
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    func setNavBar() {
        // navigation bar Setting
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 5.0/255.0, green: 150.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    func forceOrientation() {
        // Force the device in LandscapeRight mode
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeRight.rawValue, forKey: "orientation")
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


