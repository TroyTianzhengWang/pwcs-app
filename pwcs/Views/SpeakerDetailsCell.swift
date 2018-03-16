//
//  SpeakerDetailsCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/16/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import UIFontComplete

class SpeakerDetailsCell: UITableViewCell {
    
    var speaker = Speaker(name: "Chen Man", title: "Famous Photographer", desc: "She is a photographer", img: #imageLiteral(resourceName: "manchen"))
    
    var bgView = UIView()
    var speakerImage = UIImageView()
    var speakerName = UILabel()
    var speakerTitle = UILabel()
    var speakerDesc = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(_ currSpeaker: Speaker) {
        speaker = currSpeaker
        setUpBackgrounds()
        setUpSpeakerImg()
        setUpSpeakerName()
        setUpSpeakerTitle()
        setUpSpeakerDesc()
    }
    
    func setUpBackgrounds() {
        self.addSubview(bgView)
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
    
    func setUpSpeakerImg() {
        bgView.addSubview(speakerImage)
        speakerImage.image = speaker.img
        speakerImage.snp.makeConstraints{(make) -> Void in
            make.width.height.equalTo(110)
            make.centerX.equalTo(bgView)
            make.top.equalTo(bgView).offset(20)
        }
        speakerImage.layer.cornerRadius = 55
        speakerImage.layer.borderColor = UIColor.red.cgColor
        speakerImage.layer.borderWidth = 2.0
        speakerImage.layer.masksToBounds = true
        speakerImage.clipsToBounds = true
    }
    
    func setUpSpeakerName() {
        bgView.addSubview(speakerName)
        speakerName.text = speaker.name
        speakerName.font = UIFont(font: .avenirNextMedium, size: 25)
        speakerName.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(speakerImage.snp.bottom).offset(15)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(25)
        }
        speakerName.textAlignment = .center
    }
    
    func setUpSpeakerTitle() {
        bgView.addSubview(speakerTitle)
        speakerTitle.text = speaker.title
        speakerTitle.font = UIFont(font: .avenirNextRegular, size: 18)
        speakerTitle.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(speakerName.snp.bottom).offset(5)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(20)
        }
        speakerTitle.textAlignment = .center
    }
    
    func setUpSpeakerDesc() {
        bgView.addSubview(speakerDesc)
        speakerDesc.text = speaker.desc
        speakerDesc.font = UIFont(font: .avenirNextRegular, size: 15)
        speakerDesc.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(speakerTitle.snp.bottom).offset(15)
            make.left.equalTo(bgView).offset(20)
            make.right.equalTo(bgView).offset(-20)
            make.bottom.equalTo(bgView).offset(-20)
        }
        speakerDesc.lineBreakMode = .byWordWrapping
        speakerDesc.textAlignment = .justified
        speakerDesc.numberOfLines = 0
    }

}
