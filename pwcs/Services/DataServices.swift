//
//  DataServices.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation

class DataServices {
    
    var shared = DataServices()
    
    var speakers:[Speaker]
    var panels:[Panel]
    
    init() {
        speakers = [Speaker]()
        panels = [Panel]()
    }
    
    func getSpeakers() -> [Speaker] {
        return speakers
    }
    
    func getPanels() -> [Panel] {
        return panels
    }
    
    private func readInSpeakers() {
    }
    
    private func readInPanels() {
    }
    
}
