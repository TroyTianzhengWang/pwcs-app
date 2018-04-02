//
//  Enums.swift
//  pwcs
//
//  Created by Zhilei Zheng on 4/2/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import MapKit

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
    case annenbergCenter
    case irvineAuditorium
    case innAtPenn
    case sheraton
    case marriot
    case theStudy
    case special
    
    func translateLocation() -> String {
        switch self {
        case .annenbergCenter:
            return "Annenberg Center"
        case .irvineAuditorium:
            return "Irvine Auditorium"
        case .innAtPenn:
            return "Hilton Inn At Penn"
        case .sheraton:
            return "Sheraton in University City"
        case .marriot:
            return "Marriot Downtown"
        case .theStudy:
            return "The Study"
        default:
            return "TBA"
        }
    }
    
    func translateCoordinates() -> CLLocation {
        switch self {
        case .annenbergCenter:
            return CLLocation(latitude: 39.9528219, longitude: -75.1962859)
        case .irvineAuditorium:
            return CLLocation(latitude: 39.9509218, longitude: -75.1929818)
        case .innAtPenn:
            return CLLocation(latitude: 39.9535974, longitude: -75.1958157)
        case .sheraton:
            return CLLocation(latitude: 39.9548644, longitude: -75.1941684)
        case .marriot:
            return CLLocation(latitude: 39.952575, longitude: -75.160527)
        case .theStudy:
            return CLLocation(latitude: 39.954523, longitude: -75.190019)
        default:
            return CLLocation(latitude: 39.952385, longitude: -75.190356)
        }
    }
}
