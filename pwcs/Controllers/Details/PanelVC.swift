//
//  PanelVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SwiftIcons
import UIFontComplete
import MapKit

class PanelVC: UIViewController {
    
    var backButton = UIButton()
    var baseView = UIScrollView();
    var banner = UIImage()
    var mapView = MKMapView()
    let annotation = MKPointAnnotation()
    let initialLocation = CLLocation(latitude: 39.95222, longitude: -75.19321)
    let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(baseView);
        baseView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        setUpView()
    }
    
    func setUpView() {
        baseView.addSubview(mapView)
        mapView.snp.makeConstraints{ (make) -> Void in
            make.height.equalTo(200)
            make.left.equalTo(baseView).offset(0)
            make.bottom.equalTo(baseView).offset(0)
            make.right.equalTo(baseView).offset(0)
        }
        centerMapOnLocation(location: initialLocation)
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "Annenburg Theatre"
        mapView.addAnnotation(annotation)
        backButton.setIcon(prefixText: "", prefixTextColor: .red, icon: .googleMaterialDesign(.arrowBack), iconColor: .red, postfixText: " Back", postfixTextColor: .red, forState: .normal, textSize: 20, iconSize: 18)
        baseView.addSubview(backButton)
        backButton.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(baseView).offset(10)
            make.left.equalTo(baseView).offset(15)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}
