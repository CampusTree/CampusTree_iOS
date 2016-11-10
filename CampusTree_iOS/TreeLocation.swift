//
//  TreeLocation.swift
//  CampusTree_iOS
//
//  Created by Daesub Kim on 2016. 11. 10..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import Foundation

struct TreeLocation: CustomStringConvertible {
    var lat: Double
    var lng: Double
    var treeName: String
    
    var description: String {
        return "TreeLocation: \(treeName)(\(lat),\(lng))"
    }
}