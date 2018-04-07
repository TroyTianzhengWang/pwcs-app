//
//  Speaker.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import UIKit

struct Speaker {
    var name : String
    var title : String
    var desc : String
    var imgUrl : String
    var panelType : PanelType
    
    init(name:String, title:String, desc:String, panelType:PanelType, imgUrl: String = "https://s3.amazonaws.com/pwcs2018/speaker-fu-ying.png") {
        self.name = name
        self.title = title
        self.desc = desc
        self.imgUrl = imgUrl
        self.panelType = panelType
    }
    
}
