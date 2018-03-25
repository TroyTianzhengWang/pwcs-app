//
//  SpeakerCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/18/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit
import UIFontComplete

class SpeakerCell: UICollectionViewCell {
    
    var speakerImg = UIImageView();
    var speakerName = UILabel();
    var speakerTitle = UILabel();
    
    func setUpView(with speaker:Speaker) {
        self.addSubview(speakerName)
        self.addSubview(speakerTitle)
        setUpImg(speaker)
        setUpName(speaker)
        setUpTitle(speaker)
    }
    
    func setUpImg(_ speaker: Speaker) {
        speakerImg.image = speaker.img
        self.addSubview(speakerImg)
        speakerImg.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(20)
            make.width.height.equalTo(110)
            make.centerX.equalTo(self)
        }
        speakerImg.layer.cornerRadius = 55
        speakerImg.layer.borderColor = UIColor.red.cgColor
        speakerImg.layer.borderWidth = 2.0
        speakerImg.layer.masksToBounds = true
        speakerImg.clipsToBounds = true
    }
    
    func setUpName(_ speaker: Speaker) {
        speakerName.text = speaker.name
        speakerName.textAlignment = .center
        speakerName.font = UIFont(font: .avenirNextMedium, size: 15)
        self.addSubview(speakerName)
        speakerName.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
            make.centerX.equalTo(self)
            make.top.equalTo(speakerImg).offset(110)
            make.height.equalTo(25)
        }
    }
    
    func setUpTitle(_ speaker: Speaker) {
        speakerTitle.text = speaker.title
        speakerTitle.numberOfLines = 2
        speakerTitle.lineBreakMode = .byWordWrapping
        speakerTitle.textAlignment = .center
        speakerTitle.font = UIFont(font: .avenirLight, size: 14)
        self.addSubview(speakerTitle)
        speakerTitle.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.top.equalTo(speakerName).offset(20)
            make.height.equalTo(50)
        }
    }
    
}

