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
    
    var sectionData = DataServices.shared.getSchedule(for: 0)
    var day:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionData = DataServices.shared.getSchedule(for: day)
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
                                             bundle: Bundle(url: nibUrl!)!)
        tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
        tableView.separatorColor = .clear
        tableView.reloadData()
    }
    
    func setUpDay(day: Int) {
        self.day = day
        sectionData = DataServices.shared.getSchedule(for: day)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
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
        cell.bubbleColor = UIColor.red
        cell.titleLabel.font = UIFont(font: .avenirNextDemiBold, size: 16)
        
        if let thumbnail = thumbnail {
            cell.thumbnailImageView.image = UIImage(named: thumbnail)
        } else {
            cell.thumbnailImageView.image = nil
        }
        
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
        } else {
            cell.illustrationImageView.image = nil
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sectionData[indexPath.row])
    }
}
