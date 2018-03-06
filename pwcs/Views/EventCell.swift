//
//  EventCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/18/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    var eventName = UILabel();
    var eventTime = UILabel();
    var eventLocation = UILabel();
    var eventBackground = UIImageView();
    
    func setUpView(with event:Event) {
        self.contentView.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: -1.0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.contentView.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        setUpBackground(event)
        setUpTime(event)
        setUpName(event)
        setUpLocation(event)
    }
    
    func setUpBackground(_ event:Event) {
        eventBackground.image = event.background
        eventBackground.layer.cornerRadius = 20
        eventBackground.layer.masksToBounds = true
        eventBackground.clipsToBounds = true
        self.backgroundView = eventBackground
    }
    
    func setUpTime(_ event: Event) {
        eventTime.text = event.time
        eventTime.textAlignment = .left
        eventTime.font = UIFont(font: .avenirNextRegular, size: 15)
        eventTime.textColor = .white
        self.addSubview(eventTime)
        eventTime.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(self).offset(20)
        }
    }
    
    func setUpName(_ event: Event) {
        eventName.text = event.name
        eventName.textAlignment = .left
        eventName.font = UIFont(font: .avenirNextCondensedDemiBold, size: 30)
        eventName.textColor = .white
        self.addSubview(eventName)
        eventName.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(eventTime).offset(25)
            make.height.equalTo(35)
            make.width.equalTo(self).offset(20)
        }
    }
    
    func setUpLocation(_ event: Event) {
        eventLocation.text = event.location
        eventLocation.textAlignment = .left
        eventLocation.font = UIFont(font: .avenirNextRegular, size: 15)
        eventLocation.textColor = .white
        self.addSubview(eventLocation)
        eventLocation.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(eventName).offset(40)
            make.height.equalTo(20)
            make.width.equalTo(self).offset(20)
        }
    }
    
    
}

