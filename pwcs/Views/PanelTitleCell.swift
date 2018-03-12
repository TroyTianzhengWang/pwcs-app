//
//  PanelTitleCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/12/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit

class PanelTitleCell: UITableViewCell {
    
    var bgView = UIView()
    var panelImage = UIImageView()
    var panelTitle = UILabel()
    var panelDesc = UILabel()
    
    func setUpView() {
        self.addSubview(bgView)
        bgView.addSubview(panelImage)
        bgView.addSubview(panelTitle)
        bgView.addSubview(panelDesc)
        setUpBackground()
        setUpImage()
        setUpTitle()
        setUpDesc()
    }
    
    func setUpBackground() {
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
    
    func setUpImage() {
        panelImage.image = #imageLiteral(resourceName: "panelimg")
        panelImage.layer.cornerRadius = 6.0
        panelImage.layer.masksToBounds = true
        panelImage.clipsToBounds = true
        panelImage.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(200)
        }
    }
    
    func setUpTitle() {
        panelTitle.text = "Finance Panel"
        panelTitle.font = UIFont(font: .avenirNextDemiBold, size: 25)
        panelTitle.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelImage.snp.bottom).offset(10)
            make.left.equalTo(bgView).offset(10)
            make.right.equalTo(bgView).offset(10)
            make.height.equalTo(25)
        }
    }
    
    func setUpDesc() {
        panelDesc.text = "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "
        panelDesc.font = UIFont(font: .avenirNextRegular, size: 15)
        panelDesc.lineBreakMode = .byWordWrapping
        panelDesc.textAlignment = .justified
        panelDesc.numberOfLines = 5
        panelDesc.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelTitle.snp.bottom).offset(5)
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
