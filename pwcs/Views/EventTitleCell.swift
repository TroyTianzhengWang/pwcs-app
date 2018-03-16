//
//  EventTitleCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/16/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit

class EventTitleCell: UITableViewCell {
    
    var bgView = UIView()
    var eventImage = UIImageView()
    var eventTitle = UILabel()
    var eventTime = UILabel()
    var eventLocation = UILabel()
    var eventDesc = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(event: Event) {
        self.addSubview(bgView)
        bgView.addSubview(eventImage)
        bgView.addSubview(eventTitle)
        bgView.addSubview(eventTime)
        bgView.addSubview(eventLocation)
        bgView.addSubview(eventDesc)
        setUpBackground(event)
        setUpImage(event)
        setUpTitle(event)
        setUpTimeLoc(event)
        setUpDesc(event)
    }
    
    func setUpBackground(_ event: Event) {
        bgView.layer.cornerRadius = 6.0
        bgView.layer.borderColor  =  UIColor.clear.cgColor
        bgView.layer.borderWidth = 5.0
        bgView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        bgView.backgroundColor = .white
        bgView.layer.masksToBounds = false
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowRadius = 3.0
        bgView.layer.shadowOffset = CGSize(width: -1, height: 2)
    }
    
    func setUpImage(_ event: Event) {
        eventImage.image = event.background
        eventImage.layer.cornerRadius = 6.0
        eventImage.layer.masksToBounds = true
        eventImage.clipsToBounds = true
        eventImage.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(200)
        }
    }
    
    func setUpTitle(_ event: Event) {
        eventTitle.text = event.name
        eventTitle.font = UIFont(font: .avenirNextDemiBold, size: 25)
        eventTitle.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(eventImage.snp.bottom).offset(10)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(10)
            make.height.equalTo(25)
        }
    }
    
    func setUpTimeLoc(_ event: Event) {
        eventTime.setIcon(prefixText: "", prefixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, prefixTextColor: .black, icon: .icofont(.calendar), iconColor: .black, postfixText: "  \(event.time)", postfixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, postfixTextColor: .black, iconSize: 16)
        eventLocation.setIcon(prefixText: "", prefixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, prefixTextColor: .black, icon: .icofont(.locationPin), iconColor: .black, postfixText: "  \(event.location)", postfixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, postfixTextColor: .black, iconSize: 16)
        eventTime.textAlignment = .left
        eventLocation.textAlignment = .left
        eventTime.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(eventTitle.snp.bottom).offset(12)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.height.equalTo(18)
        }
        eventLocation.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(eventTime.snp.bottom).offset(5)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.height.equalTo(18)
        }
    }
    
    func setUpDesc(_ event: Event) {
        eventDesc.text = event.desc
        eventDesc.font = UIFont(font: .avenirNextRegular, size: 15)
        eventDesc.lineBreakMode = .byWordWrapping
        eventDesc.textAlignment = .justified
        eventDesc.numberOfLines = 5
        eventDesc.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(eventLocation.snp.bottom).offset(3)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.bottom.equalTo(bgView).offset(-10)
        }
    }



}
