//
//  AboutVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/6/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit
import UIFontComplete

class AboutVC: UIViewController {
    
    var scrollBg = UIScrollView()
    var descLabel = UILabel()
    var logoImg = UIImageView()
    var copyRightLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollBg);
        scrollBg.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(-40)
            make.right.equalTo(view).offset(0)
        }
        setUpLogo()
        setUpLabel()
        setUpCopyRight()
        scrollBg.contentSize.height = 9000
        scrollBg.translatesAutoresizingMaskIntoConstraints = false
        scrollBg.alwaysBounceVertical = true
        scrollBg.alwaysBounceHorizontal = false
    }
    
    func setUpLabel() {
        descLabel.text = "Penn Wharton China Summit is hosted by the China Summit Foundation and the Penn Wharton China Center, and further supported by the Chinese embassy and the government of Pennsylvania. The summit is committed to building an influential platform that promotes communications between the two countries and establish connections among students oversea in the United States. \n\nWith over 1500 attendees coming from 4 countries, 34 States and over 70 Cities, the inaugural PWCS in April 2016 has already become the largest student organized summit in the United States. "
        descLabel.lineBreakMode = .byWordWrapping
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .justified
        descLabel.font = UIFont(font: .avenirNextRegular, size: 14)
        scrollBg.addSubview(descLabel);
        descLabel.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(scrollBg).offset(20)
            make.width.equalTo(view.frame.size.width - 40)
            make.top.equalTo(logoImg.snp.bottom).offset(20)
            make.right.equalTo(scrollBg).offset(-20)
        }
    }
    
    func setUpLogo() {
        logoImg.image = #imageLiteral(resourceName: "logo")
        scrollBg.addSubview(logoImg)
        logoImg.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(scrollBg)
            make.top.equalTo(scrollBg).offset(30)
            make.width.equalTo(120)
            make.height.equalTo(90)
        }
        logoImg.contentMode = .scaleAspectFit
    }
    
    func setUpCopyRight() {
        copyRightLabel.text = "© 2018 whartonsummit.org, courtesy of Daning Tu, Lula Chou, Mindy Ma and Zhilei Zheng"
        copyRightLabel.lineBreakMode = .byWordWrapping
        copyRightLabel.numberOfLines = 0
        copyRightLabel.textAlignment = .center
        copyRightLabel.font = UIFont(font: .avenirNextRegular, size: 12)
        copyRightLabel.textColor = .gray
        scrollBg.addSubview(copyRightLabel);
        copyRightLabel.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(scrollBg).offset(60)
            make.top.equalTo(descLabel.snp.bottom).offset(20)
            make.width.equalTo(view.frame.size.width - 40)
            make.right.equalTo(scrollBg).offset(-60)
        }
    }

}
