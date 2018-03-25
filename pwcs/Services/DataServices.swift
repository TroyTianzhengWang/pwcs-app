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
    private var rawEvents = [Event]()
    private var schedules = [Int: [(TimelinePoint, UIColor, String, String, String?, String?, String?)]]()
    
    init() {
        readInPanels()
        readInSpeakers()
        readInSchedule()
        readInEvents()
    }
    
    func getSpeakers(for panelType : PanelType) -> [Speaker] {
        guard let speakers = panelSpeakers[panelType] else {
            return []
        }
        return speakers
    }
    
    func getPanel(for panelType : PanelType) -> Panel {
        guard let panel = panels[panelType] else {
            return Panel(name: "other", location: LocationType.special, time: "TBA", background: #imageLiteral(resourceName: "event-bg"), desc: "TBA")
        }
        return panel
    }
    
    func getPanels() -> [Panel] {
//        var results = [Panel]()
//        for (_ , panel) in panels {
//            results.append(panel)
//        }
//        return results
        return rawPanels
    }
    
    func getEvents() -> [Event] {
        return rawEvents
    }
    
    func getSchedule(for day : Int) -> [(TimelinePoint, UIColor, String, String, String?, String?, String?)]{
        guard let schedule = schedules[day] else {
            return [(TimelinePoint(), UIColor.black, "Other", "TBA", nil, nil, nil)]
        }
        return schedule
    }
    
    private func readInSpeakers() {
        
    }
    
    private func readInRawSpeakers() {
        
    }
    
    private func readInPanels() {
        rawPanels.append(Panel(name: "Finance Panel", location: LocationType.annenburgCenter, time: "9:00PM - 11:00PM | Friday", background: #imageLiteral(resourceName: "panel-social"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Social Responsibility Panel", location: .irvineAuditorium, time: "10:00AM - 11:00AM | Saturday", background: #imageLiteral(resourceName: "panel-bg-1"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "International Relations Panel", location: .annenburgCenter, time: "12:00PM - 13:00PM | Sunday", background: #imageLiteral(resourceName: "panel-bg-2"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Real Estate Panel", location: .irvineAuditorium, time: "9:00PM - 11:00PM | Friday", background: #imageLiteral(resourceName: "panel-social"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Arts and Fashion Panel", location: .annenburgCenter, time: "10:00AM - 11:00AM | Saturday", background: #imageLiteral(resourceName: "panel-bg-1"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
        rawPanels.append(Panel(name: "Technology Panel", location: .irvineAuditorium, time: "12:00PM - 13:00PM | Sunday", background: #imageLiteral(resourceName: "panel-bg-2"), desc: "For the past decade, low real interest rates, declining productivity growth, and lack of attractive domestic investment opportunities have forced global investors to seek higher returns in less familiar territories. "))
    }
    
    private func readInEvents() {
        rawEvents.append(Event(name: "VIP Banquet", location: .special, time: "10:00AM - 11:00AM | Saturday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
        rawEvents.append(Event(name: "Recruiting Panel", location: .special, time: "9:00PM - 11:00PM | Friday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
        rawEvents.append(Event(name: "InnoTalk", location: .special, time: "12:00PM - 13:00PM | Sunday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg")))
    }
    
    private func readInFAQ() {
        
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
