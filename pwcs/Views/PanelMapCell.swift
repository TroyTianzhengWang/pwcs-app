//
//  PanelMapCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/12/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import MapKit

class PanelMapCell: UITableViewCell {
    
    var mapView = MKMapView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let initialLocation = CLLocation(latitude: 39.952385, longitude: -75.190356)
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setUpView() {
        self.addSubview(mapView)
        mapView.layer.cornerRadius = 6.0
        mapView.layer.borderColor  =  UIColor.clear.cgColor
        mapView.layer.borderWidth = 5.0
        mapView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        mapView.layer.masksToBounds = false
        mapView.layer.shadowColor = UIColor.lightGray.cgColor
        mapView.layer.shadowOpacity = 1
        mapView.layer.shadowRadius = 3.0
        mapView.layer.shadowOffset = CGSize(width: -1, height: 2)
        centerMapOnLocation(location: initialLocation)
    }

}
