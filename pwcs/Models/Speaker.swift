//
//  Speaker.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Speaker {
    var name : String
    var title : String
    var desc : String
    var img : UIImage
    var panelType : PanelType
    
    init(name:String, title:String, desc:String, img:UIImage, panelType:PanelType) {
        self.name = name
        self.title = title
        self.desc = desc
        self.img = img
        self.panelType = panelType
    }
    
}

enum PanelType {
    case finance
    case technology
    case fashion
    case realEstate
    case internationalRelations
    case socialResponsibility
    
    case openingCeremony
    case closingCeremony
    
    case individual
    case special
}

enum LocationType {
    case annenburgCenter
    case irvineAuditorium
    case innAtPenn
    case special
    
    func translateLocation() -> String {
        switch self {
        case .annenburgCenter:
            return "Annenburg Center"
        case .irvineAuditorium:
            return "Irvine Auditorium"
        case .innAtPenn:
            return "Inn At Penn"
        default:
            return "TBA"
        }
    }
    
    func translateCoordinates() -> CLLocation {
        switch self {
        case .annenburgCenter:
            return CLLocation(latitude: 39.952385, longitude: -75.190356)
        case .irvineAuditorium:
            return CLLocation(latitude: 39.952385, longitude: -75.190356)
        case .innAtPenn:
            return CLLocation(latitude: 39.952385, longitude: -75.190356)
        default:
            return CLLocation(latitude: 39.952385, longitude: -75.190356)
        }
    }
}
