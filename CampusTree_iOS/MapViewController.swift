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

    @IBOutlet var aMapView: UIView!
    
    var locations: [TreeLocation]! = [TreeLocation]()
    var marker: GMSMarker!
    
    let intialLat = 36.83650519834776
    let intialLng = 127.16871175915003
    let intialZoom: Float = 17.0
    let earthRadius = 0.000008998719243599958
    
    var scale: Double!
    var currentZoom: Float!
    let circleRadius = 15.0
    
    // RGBA(20,255,0,0)
    let fillColor = UIColor(red: 20/255, green: 255/255, blue: 0/255, alpha: 1.0)
    let strokeColor = UIColor.redColor()
    let strokeWidth: CGFloat = 1.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dataLoad()
        createSearchBar()
        setNavBar()
        forcedOrientation()
        
        //myLoadView()
        //self.aDetailView!.hidden = true
    }
    override func viewDidAppear(animated: Bool) {
        forcedOrientation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Init Map
    override func loadView() {
        let camera = GMSCameraPosition.cameraWithLatitude(intialLat, longitude: intialLng, zoom: intialZoom)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.setMinZoom(17, maxZoom: 20)
        mapView.delegate = self
        self.view = mapView
        
        self.currentZoom = intialZoom
        setScaleWithZoom(intialZoom)
    }
    /*func myLoadView() {
        let camera = GMSCameraPosition.cameraWithLatitude(intialLat, longitude: intialLng, zoom: intialZoom)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.setMinZoom(17, maxZoom: 20)
        //mapView.delegate = self.aMapView
        //self.view = mapView
        aMapView = mapView
        
        self.currentZoom = intialZoom
        setScaleWithZoom(intialZoom)
    }*/
    
    // Map에서 Zoom 변경시
    func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
        self.currentZoom = position.zoom
        setScaleWithZoom(currentZoom)
        
    }
    // Map에 Tap 했을시
    func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        
        let tappedlat = coordinate.latitude
        let tappedlng = coordinate.longitude
        
        let camera = GMSCameraPosition.cameraWithLatitude(tappedlat, longitude: tappedlng, zoom: self.currentZoom)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.setMinZoom(17, maxZoom: 20)
        mapView.delegate = self
        self.view = mapView
        //self.aMapView = mapView
        
        // Draw Circle
        let circleCenter : CLLocationCoordinate2D  = CLLocationCoordinate2DMake(tappedlat, tappedlng);
        let circ = GMSCircle(position: circleCenter, radius: circleRadius)
        circ.fillColor = self.fillColor
        circ.strokeColor = self.strokeColor
        circ.strokeWidth = self.strokeWidth
        circ.map = mapView
        
    
        for i in 0..<locations.count {
            if (sqrt(pow(locations[i].lat - tappedlat, 2) + pow(locations[i].lng - tappedlng, 2)) / earthRadius < (self.scale * self.circleRadius) ) {
    
                marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(locations[i].lat, locations[i].lng)
                marker.title = locations[i].treeName
                marker.map = mapView
            }
        }
        
        print("Tapped (\(tappedlat), \(tappedlng)) / Zoom : \(currentZoom) / Scale : \(scale)" )
    }


    func setScaleWithZoom(_zoom: Float) {
        let zoom: Float = _zoom
        if zoom > 20.0 {
            self.scale = 0.9
        } else if zoom > 19.0 {
            self.scale = 1.0
        } else if zoom > 18.0 {
            self.scale = 1.01
        } else if zoom > 17.0 {
            self.scale = 1.05
        } else {
            self.scale = 1.1
            //2.0
        }
    }
    
    // TreeLocation Data Load. 나중에 위치 옮겨야함.
    func dataLoad() {
        
        let path = NSBundle.mainBundle().pathForResource("CampusTree_Data/treeLocationDataset", ofType: "csv")
        
        let fileMgr = NSFileManager.defaultManager()
        if fileMgr.fileExistsAtPath(path!) {
            
            do {
                
                let fullText = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
                let readings = fullText.componentsSeparatedByString("\r\n") as [String]
                
                for i in 0..<readings.count {
                    
                    let data = readings[i].componentsSeparatedByString(",")
         
                    locations.append(TreeLocation(lat: data[1].toDouble(), lng: data[2].toDouble(), treeName: "\(data[3])"))
                }
                
                print("Locations : \(locations)")
            } catch let error as NSError {
                print("Error : \(error)")
            }
        }

    }
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
    
    func forcedOrientation() {
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

extension String {
    func toDouble() -> Double {
        if let unwrappedNum = Double(self) {
            return unwrappedNum
        }
        else {
            print("Error converting \"" + self + "\" to Double")
            return 0.0
        }
    }
    func toInt() -> Int {
        if let unwrappedNum = Int(self) {
            return unwrappedNum
        }
        else {
            print("Error converting \"" + self + "\" to Int")
            return 0
        }
    }
}


