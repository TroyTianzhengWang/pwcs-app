//
//  PanelCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class PanelCell: UICollectionViewCell {
    
    var panelName = UILabel();
    var panelTime = UILabel();
    var panelLocation = UILabel();
    var panelBackground = UIImageView();
    
    func setUpView(with panel:Panel) {
        self.contentView.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 6.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: -1.0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.contentView.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        setUpBackground(panel)
        setUpTime(panel)
        setUpName(panel)
        setUpLocation(panel)
    }
    
    func setUpBackground(_ panel: Panel) {
        panelBackground.image = panel.background
        panelBackground.layer.cornerRadius = 6
        panelBackground.layer.masksToBounds = true
        panelBackground.clipsToBounds = true
        self.backgroundView = panelBackground
    }
    
    func setUpTime(_ panel: Panel) {
        panelTime.text = panel.time
        panelTime.textAlignment = .left
        panelTime.font = UIFont(font: .avenirNextRegular, size: 15)
        self.addSubview(panelTime)
        panelTime.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(self).offset(20)
        }
    }
    
    func setUpName(_ panel: Panel) {
        panelName.text = panel.name
        panelName.textAlignment = .left
        panelName.font = UIFont(font: .avenirNextCondensedDemiBold, size: 24)
        self.addSubview(panelName)
        panelName.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(panelTime).offset(25)
            make.height.equalTo(28)
            make.width.equalTo(self).offset(20)
        }
    }
    
    func setUpLocation(_ panel: Panel) {
        panelLocation.text = panel.location.translateLocation()
        panelLocation.textAlignment = .left
        panelLocation.font = UIFont(font: .avenirNextRegular, size: 15)
        self.addSubview(panelLocation)
        panelLocation.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(panelName.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(self).offset(20)
        }
    }
    
    
}
