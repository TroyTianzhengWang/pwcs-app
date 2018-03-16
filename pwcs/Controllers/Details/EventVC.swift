//
//  EventVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class EventVC: UIViewController {

//    var tableView = UITableView()
//
//    var event : E
//
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpBackground()
//        setUpTableView()
    }
//
//    private func setUpBackground() {
//        view.backgroundColor = .white
//        self.navigationController?.navigationBar.topItem?.title = "Panels"
//        self.navigationController?.navigationBar.tintColor = .red
//        self.title = event?.name
//    }
//
//    private func setUpTableView() {
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = .none
//        tableView.snp.makeConstraints{(make) -> Void in
//            make.top.equalTo(view)
//            make.bottom.equalTo(view)
//            make.left.equalTo(view)
//            make.right.equalTo(view)
//        }
//        tableView.register(PanelTitleCell.self, forCellReuseIdentifier: "title")
//        tableView.register(PanelSpeakerCell.self, forCellReuseIdentifier: "speaker")
//        tableView.register(PanelMapCell.self, forCellReuseIdentifier: "map")
//    }
//}
//
//extension EventVC: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (section == 0) {
//            return 1
//        } else if (section == 1) {
//            return 1
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if (indexPath.section == 0) {
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "title") as? PanelTitleCell {
////                cell.setUpView()
//                return cell
//            }
//        } else if (indexPath.section == 1) {
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "map") as? PanelMapCell {
//                cell.setUpView()
//                return cell
//            }
//        }
//        return UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if (indexPath.section == 0) {
//            return 400
//        } else if (indexPath.section == 1) {
//            return 200
//        }
//        return 0
//    }


}
