//
//  EventMapCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/16/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import MapKit

class EventMapCell: UITableViewCell {
    
    var mapView = MKMapView()
    
    var event: Event?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setUpView(with event: Event) {
        self.addSubview(mapView)
        self.event = event
        setUpMapLayout()
        setUpMapAnnotation()
        setUpMapResponse()
    }
    
    func setUpMapLayout() {
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
    }
    
    func setUpMapAnnotation() {
        centerMapOnLocation(location: event!.location.translateCoordinates())
        let annotation = MKPointAnnotation()  // <-- new instance here
        annotation.coordinate = event!.location.translateCoordinates().coordinate
        annotation.title = event!.location.translateLocation()
        mapView.addAnnotation(annotation)
    }
    
    func setUpMapResponse() {
        mapView.isZoomEnabled = false
        mapView.isUserInteractionEnabled = false
        mapView.isScrollEnabled = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onMapViewTapped))
        mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onMapViewTapped() {
        PanelVC().addTapped()
    }

}
