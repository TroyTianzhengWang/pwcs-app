//
//  DataServices.swift
//  pwcs
//
//  Created by Zhilei Zheng on 1/20/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import Foundation
import TimelineTableViewCell

class DataServices {
    
    static let shared = DataServices()
    
    private var panels = [PanelType : Panel]()
    private var panelSpeakers = [PanelType : [Speaker]]()
    private var rawPanels = [Panel]()
    private var rawSpeakers = [Panel]()
    private var schedules = [Int: [(TimelinePoint, UIColor, String, String, String?, String?, String?)]]()
    
    init() {
        readInPanels()
        readInSpeakers()
        readInSchedule()
    }
    
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
    
    func getSchedule(for day : Int) -> [(TimelinePoint, UIColor, String, String, String?, String?, String?)]{
        guard let schedule = schedules[day] else {
            return [(TimelinePoint(), UIColor.black, "Other", "TBA", nil, nil, nil)]
        }
        return schedule
    }
    
    private func readInSpeakers() {
        
    }
    
    private func readInPanels() {
    }
    
    private func readInSchedule() {
        schedules = [0:[
            (TimelinePoint(), UIColor.black, "1:30: Panel 1", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "15:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "16:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "150 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.clear, "19:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Moon")
            ], 1:[
                (TimelinePoint(), UIColor.black, "2:30: Day 2", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
                (TimelinePoint(), UIColor.black, "15:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
                (TimelinePoint(), UIColor.black, "16:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "150 mins", "Apple", "Sun"),
                (TimelinePoint(), UIColor.clear, "19:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Moon")
            ], 2:[
                (TimelinePoint(), UIColor.black, "3:30: Day 3", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
                (TimelinePoint(), UIColor.black, "15:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
                (TimelinePoint(), UIColor.black, "16:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "150 mins", "Apple", "Sun"),
                (TimelinePoint(), UIColor.clear, "19:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Moon")
            ]]
    }
    
}
