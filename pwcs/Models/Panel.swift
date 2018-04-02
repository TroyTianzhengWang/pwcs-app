//
//  Panel.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import UIKit

struct Panel {
    var name:String
    var location:LocationType
    var time:String
    var background:UIImage
    var desc:String
    var speakers:[String]
    var type:PanelType
    
    init(type:PanelType, name:String, location:LocationType, time:String, background:UIImage, desc:String) {
        self.type = type
        self.name = name
        self.location = location
        self.time = time
        self.background = background
        self.desc = desc
        self.speakers = []
    }
    
}
