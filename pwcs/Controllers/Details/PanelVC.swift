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
    
    var tableView = UITableView()
    
    var panel = Panel(type: .finance, name: "Finance Panel", location: LocationType.annenburgCenter, time: "April 14th, 11:00AM - 2:00PM", background:#imageLiteral(resourceName: "panelimg"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. ")
    
    var speakers = [Speaker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem()
        rightButton.setIcon(icon: .ionicons(.map), iconSize: 25, color: .red, cgRect: CGRect(x: 10, y: 5, width: 25, height: 25), target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = rightButton
        self.navigationController?.navigationBar.tintColor = .red
    }
    
    func setUpForPanel(panel: Panel) {
        self.panel = panel
        speakers = DataServices.shared.getSpeakers(for: panel.type)
        setUpBackground()
        setUpTableView()
        tableView.allowsSelection = false;
    }
    
    @objc func addTapped() {
        let location = CLLocation(latitude: 39.952385, longitude: -75.190356)
        let coordinates = location.coordinate
        let regionDistance:CLLocationDistance = 1000
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Annenburg Center"
        mapItem.openInMaps(launchOptions: options)
    }
    
    private func setUpBackground() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("panels", comment: "")
        self.navigationController?.navigationBar.tintColor = .red
        self.title = panel.name
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        tableView.register(PanelTitleCell.self, forCellReuseIdentifier: "title")
        tableView.register(PanelSpeakerCell.self, forCellReuseIdentifier: "speaker")
        tableView.register(PanelMapCell.self, forCellReuseIdentifier: "map")
    }
}

extension PanelVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) {
            return 1
        } else if (section == 2) {
            return speakers.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "title") as? PanelTitleCell {
                cell.setUpView(panel: panel)
                return cell
            }
        } else if (indexPath.section == 1) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "map") as? PanelMapCell {
                cell.setUpView(with: panel)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "speaker") as? PanelSpeakerCell {
                cell.setUpView(with: speakers[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 400 + panel.desc.dynamicHeight(font: UIFont(font: .avenirNextRegular, size: 15)!, width: UIScreen.main.bounds.width - 40)
        } else if (indexPath.section == 1) {
            return 200
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1) {
            addTapped()
        }
    }
    
}

extension String {
    // https://stackoverflow.com/questions/34262863/how-to-calculate-height-of-a-string
    func dynamicHeight(font: UIFont, width: CGFloat) -> CGFloat{
        let calString = NSString(string: self)
        let textSize = calString.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
        return textSize.height
    }
}
