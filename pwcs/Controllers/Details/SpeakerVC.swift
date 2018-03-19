//
//  SpeakerVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class SpeakerVC: UIViewController {
    
    var speaker = Speaker(name: "Chen Man", title: "Famous Photographer", desc: "My interest is in building scalable software products and services with optimized user experience. Fluent in Java, JavaScript, Ruby, Swift and Python, I have accumulated experiences and a number of production-level projects in Web Development, iOS and Android Development.", img: #imageLiteral(resourceName: "manchen"), panelType: PanelType.finance)
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaults()
        setUpTableView()
    }
    
    func setUpDefaults() {
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = "Speakers"
        self.navigationController?.navigationBar.tintColor = .red
        self.title = "Chen Man"
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SpeakerDetailsCell.self, forCellReuseIdentifier: "speaker")
    }


}


extension SpeakerVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "speaker") as? SpeakerDetailsCell {
            cell.setUpView(speaker)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200 + speaker.desc.count / 40 * 35)
    }
}
