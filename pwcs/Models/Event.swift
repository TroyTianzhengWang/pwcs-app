//
//  Event.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation

import UIKit

struct Event {
    var name:String
    var location:String
    var time:String
    var desc:String
    var background:UIImage
    
    init(name:String, location:String, time:String, desc:String, background:UIImage) {
        self.name = name
        self.location = location
        self.time = time
        self.desc = desc
        self.background = background
    }
    
}
