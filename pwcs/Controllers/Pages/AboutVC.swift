//
//  AboutVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/6/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit
import UIFontComplete

class AboutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    let intro = "Penn Wharton China Summit is hosted by the China Summit Foundation and the Penn Wharton China Center, and further supported by the Chinese embassy and the government of Pennsylvania. The summit is committed to building an influential platform that promotes communications between the two countries and establish connections among students oversea in the United States. \n\nWith over 1500 attendees coming from 4 countries, 34 States and over 70 Cities, the inaugural PWCS in April 2016 has already become the largest student organized summit in the United States. "
    let copyRight = "© 2018 whartonsummit.org, courtesy of Daning Tu, Lula Chou, Mindy Ma and Zhilei Zheng"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(view).offset(0)
            make.top.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(-40)
            make.right.equalTo(view).offset(0)
        }
        tableView.register(AboutCell.self, forCellReuseIdentifier: "about")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "about") as? AboutCell {
            cell.setUpView(intro, copyRight)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250 + intro.dynamicHeight(font: UIFont(font: .avenirNextRegular, size: 14)!, width: UIScreen.main.bounds.width - 40)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
