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
        bgView.backgroundColor = .green
        bgView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self).offset(20)
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
    }
    
    func setUpImage() {
        panelImage.image = #imageLiteral(resourceName: "panelimg")
        panelImage.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(bgView)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(180)
        }
    }
    
    func setUpTitle() {
        panelTitle.text = "Finance Panel"
        panelTitle.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelImage.snp.bottom)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(15)
        }
    }
    
    func setUpDesc() {
        panelDesc.text = "Will attempt to recover by breaking constraint. Will attempt to recover by breaking constraint"
        panelDesc.lineBreakMode = .byWordWrapping
        panelDesc.numberOfLines = 0
        panelDesc.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(panelTitle.snp.bottom)
            make.left.equalTo(bgView)
            make.right.equalTo(bgView)
            make.height.equalTo(65)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
