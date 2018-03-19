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
    var img : UIImage
    var panelType : PanelType
    
    init(name:String, title:String, desc:String, img:UIImage, panelType:PanelType) {
        self.name = name
        self.title = title
        self.desc = desc
        self.img = img
        self.panelType = panelType
    }
    
}

enum PanelType {
    case finance
    case technology
    case fashion
    case realEstate
    case internationalRelations
    case socialResponsibility
    
    case openingCeremony
    case closingCeremony
    
    case individual
    case special
}
