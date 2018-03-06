//
//  ScheduleVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import TimelineTableViewCell
import UIFontComplete

class ScheduleVC: UITableViewController {
    
    // TimelinePoint, Timeline back color, title, description, lineInfo, thumbnail, illustration
    let data:[Int: [(TimelinePoint, UIColor, String, String, String?, String?, String?)]] = [0:[
        (TimelinePoint(), UIColor.black, "12:30: Panel 1", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
        (TimelinePoint(), UIColor.black, "15:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Sun"),
        (TimelinePoint(), UIColor.black, "16:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "150 mins", "Apple", "Sun"),
        (TimelinePoint(), UIColor.clear, "19:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", nil, nil, "Moon")
        ], 1:[
            (TimelinePoint(), UIColor.black, "08:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "60 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "09:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "30 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "90 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "60 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "30 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.black, "13:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "120 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.black, "15:00", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "150 mins", "Apple", "Sun"),
            (TimelinePoint(), UIColor.black, "17:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "60 mins", nil, "Sun"),
            (TimelinePoint(), UIColor.black, "18:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "60 mins", nil, "Moon"),
            (TimelinePoint(), UIColor.clear, "19:30", "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", nil, nil, "Moon")
        ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
                                             bundle: Bundle(url: nibUrl!)!)
        tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
        tableView.separatorColor = .clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Day " + String(describing: section + 1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnail, illustration) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.descriptionLabel.font = UIFont(font: .avenirNextRegular, size: 15)
        cell.lineInfoLabel.text = lineInfo
        cell.titleLabel.font = UIFont(font: .avenirNextDemiBold, size: 16)
        if let thumbnail = thumbnail {
            cell.thumbnailImageView.image = UIImage(named: thumbnail)
        }
        else {
            cell.thumbnailImageView.image = nil
        }
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
        }
        else {
            cell.illustrationImageView.image = nil
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionData = data[indexPath.section] else {
            return
        }
        
        print(sectionData[indexPath.row])
    }

    
}
