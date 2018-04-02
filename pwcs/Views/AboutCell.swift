//
//  AboutCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 4/2/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {
    
    var descLabel = UILabel()
    var logoImg = UIImageView()
    var copyRightLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpView(_ intro : String, _ copyRightText : String) {
        setUpLogo()
        setUpLabel(introText: intro)
        setUpCopyRight(copyRightText: copyRightText)
    }
    
    func setUpLabel(introText : String) {
        descLabel.text = introText
        descLabel.lineBreakMode = .byWordWrapping
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .justified
        descLabel.font = UIFont(font: .avenirNextRegular, size: 14)
        self.addSubview(descLabel);
        descLabel.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(self).offset(20)
            make.height.equalTo((descLabel.text?.dynamicHeight(font: UIFont(font: .avenirNextRegular, size: 14)!, width: UIScreen.main.bounds.width - 40))!)
            make.top.equalTo(logoImg.snp.bottom).offset(20)
            make.right.equalTo(self).offset(-20)
        }
    }
    
    func setUpLogo() {
        logoImg.image = #imageLiteral(resourceName: "logo")
        self.addSubview(logoImg)
        logoImg.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(30)
            make.width.equalTo(120)
            make.height.equalTo(90)
        }
        logoImg.contentMode = .scaleAspectFit
    }
    
    func setUpCopyRight(copyRightText : String) {
        copyRightLabel.text = copyRightText
        copyRightLabel.lineBreakMode = .byWordWrapping
        copyRightLabel.numberOfLines = 0
        copyRightLabel.textAlignment = .center
        copyRightLabel.font = UIFont(font: .avenirNextRegular, size: 12)
        copyRightLabel.textColor = .gray
        self.addSubview(copyRightLabel);
        copyRightLabel.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(self).offset(40)
            make.top.equalTo(descLabel.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.right.equalTo(self).offset(-40)
        }
    }

}
