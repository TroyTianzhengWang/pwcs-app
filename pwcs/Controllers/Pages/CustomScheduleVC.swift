//
//  CustomScheduleVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 4/6/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import TimelineTableViewCell
import UIFontComplete

class CustomScheduleVC: UIViewController {
    
    var tableView = UITableView()
    var sectionData = DataServices.shared.getSchedule(for: 0)
    var day:Int = 0
    var isDrawn:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        tableView.register(CustomScheduleCell.self, forCellReuseIdentifier: "custom")
    }
    
    func setUpDay(day: Int) {
        self.day = day
        sectionData = DataServices.shared.getSchedule(for: day)
    }

}

extension CustomScheduleVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as? CustomScheduleCell {
            let (_, _, title, description, _, _, _) = sectionData[indexPath.row]
            cell.setUpView(time: title, desc: description, isFirst: indexPath.row == 0)
            isDrawn = true
            return cell
        }
        return CustomScheduleCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let (_, _, _, description, _, _, _) = sectionData[indexPath.row]
        let linesArray = description.components(separatedBy: "\n")
        var height:CGFloat = CGFloat(0.0)
        for line in linesArray {
            height = height + line.dynamicHeight(font: UIFont(font: .avenirNextRegular, size: 15)!, width: UIScreen.main.bounds.width - 90)
        }
        return height + 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == 0 && isDrawn) {
            if let currCell = cell as? CustomScheduleCell {
                currCell.redrawLine()
            }
        }
    }
    
}
