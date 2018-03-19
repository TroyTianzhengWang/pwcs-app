//
//  DataServices.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation

class DataServices {
    
    static let shared = DataServices()
    
    private var panels = [PanelType : Panel]()
    private var panelSpeakers = [PanelType : [Speaker]]()
    private var rawPanels = [Panel]()
    private var rawSpeakers = [Panel]()
    
    func getSpeakers(for panelType : PanelType) -> [Speaker] {
        guard let speakers = panelSpeakers[panelType] else {
            return []
        }
        return speakers
    }
    
    func getPanel(for panelType : PanelType) -> Panel {
        guard let panel = panels[panelType] else {
            return Panel(name: "other", location: "TBA", time: "TBA", background: #imageLiteral(resourceName: "event-bg"), desc: "TBA")
        }
        return panel
    }
    
    func getPanels() -> [Panel] {
        var results = [Panel]()
        for (_ , panel) in panels {
            results.append(panel)
        }
        return results
    }
    
    private func readInSpeakers() {
    }
    
    private func readInPanels() {
    }
    
    
    
}
