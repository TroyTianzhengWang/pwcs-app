//
//  PanelTitleCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/12/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import SwiftIcons

class PanelTitleCell: UITableViewCell {
    
    var bgView = UIView()
    var panelImage = UIImageView()
    var panelTitle = UILabel()
    var panelTime = UILabel()
    var panelLocation = UILabel()
    var panelDesc = UILabel()
    
    func setUpView(panel: Panel) {
        self.addSubview(bgView)
        bgView.addSubview(panelImage)
        bgView.addSubview(panelTitle)
        bgView.addSubview(panelTime)
        bgView.addSubview(panelLocation)
        bgView.addSubview(panelDesc)
        setUpBackground(panel)
        setUpImage(panel)
        setUpTitle(panel)
        setUpTimeLoc(panel)
        setUpDesc(panel)
    }
    
    func setUpBackground(_ panel: Panel) {
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
    
    func setUpImage(_ panel: Panel) {
        panelImage.image = panel.background
        if #available(iOS 11.0, *) {
            panelImage.layer.cornerRadius = 6.0
            panelImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        panelImage.clipsToBounds = true
        panelImage.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(200)
        }
    }
    
    func setUpTitle(_ panel: Panel) {
        panelTitle.text = panel.name
        panelTitle.font = UIFont(font: .avenirNextDemiBold, size: 25)
        panelTitle.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelImage.snp.bottom).offset(10)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(10)
            make.height.equalTo(25)
        }
    }
    
    func setUpTimeLoc(_ panel: Panel) {
        panelTime.setIcon(prefixText: "", prefixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, prefixTextColor: .black, icon: .icofont(.calendar), iconColor: .black, postfixText: "  \(panel.time)", postfixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, postfixTextColor: .black, iconSize: 16)
        panelLocation.setIcon(prefixText: "", prefixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, prefixTextColor: .black, icon: .icofont(.locationPin), iconColor: .black, postfixText: "  \(panel.location.translateLocation())", postfixTextFont: UIFont(font: .avenirNextRegular, size: 16)!, postfixTextColor: .black, iconSize: 16)
        panelTime.textAlignment = .left
        panelLocation.textAlignment = .left
        panelTime.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelTitle.snp.bottom).offset(12)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.height.equalTo(18)
        }
        panelLocation.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelTime.snp.bottom).offset(5)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.height.equalTo(18)
        }
    }
    
    func setUpDesc(_ panel: Panel) {
        panelDesc.text = panel.desc
        panelDesc.font = UIFont(font: .avenirNextRegular, size: 15)
        panelDesc.lineBreakMode = .byWordWrapping
        panelDesc.textAlignment = .justified
        panelDesc.numberOfLines = 0
        panelDesc.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelLocation.snp.bottom).offset(3)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(-10)
            make.bottom.equalTo(bgView).offset(-10)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
