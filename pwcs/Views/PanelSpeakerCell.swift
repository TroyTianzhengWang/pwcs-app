//
//  PanelTitleCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/12/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit

class PanelSpeakerCell: UITableViewCell {
    
    var bgView = UIView()
    var speakerImage = UIImageView()
    var speakerName = UILabel()
    var speakerDesc = UILabel()
    
    var speaker = Speaker(name: "Zhou Xin", desc: "CEO of EHouse China", img: #imageLiteral(resourceName: "manchen"))
    
    func setUpView() {
        self.addSubview(bgView)
        bgView.addSubview(speakerImage)
        bgView.addSubview(speakerName)
        bgView.addSubview(speakerDesc)
        setUpBackground()
        setUpImage()
        setUpName()
        setUpDesc()
    }
    
    func setUpBackground() {
        bgView.layer.cornerRadius = 6.0
        bgView.layer.borderColor  =  UIColor.clear.cgColor
        bgView.layer.borderWidth = 5.0
        bgView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
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
        speakerImage.image = speaker.img
        speakerImage.layer.cornerRadius = 35
        speakerImage.layer.masksToBounds = true
        speakerImage.clipsToBounds = true
        speakerImage.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
    }
    
    func setUpName() {
        speakerName.text = speaker.name
        speakerName.font = UIFont(font: .avenirNextMedium, size: 20)
        speakerName.snp.makeConstraints{(make) -> Void in
            make.left.equalTo(speakerImage.snp.right).offset(20)
            make.right.equalTo(bgView).offset(10)
            make.centerY.equalTo(bgView).offset(-15)
            make.height.equalTo(20)
        }
    }
    
    func setUpDesc() {
        speakerDesc.text = speaker.desc
        speakerDesc.font = UIFont(font: .avenirNextRegular, size: 15)
        speakerDesc.snp.makeConstraints{(make) -> Void in
            make.left.equalTo(speakerImage.snp.right).offset(20)
            make.right.equalTo(bgView).offset(10)
            make.centerY.equalTo(bgView).offset(15)
            make.height.equalTo(15)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

