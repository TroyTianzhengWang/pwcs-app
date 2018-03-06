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
    var desc : String
    var img : UIImage
    
    init(name:String, desc:String, img:UIImage) {
        self.name = name
        self.desc = desc
        self.img = img
    }
    
}
