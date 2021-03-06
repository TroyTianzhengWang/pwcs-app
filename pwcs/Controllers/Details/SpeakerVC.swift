//
//  SpeakerVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class SpeakerVC: UIViewController {
    
    var speaker : Speaker?
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftButton = UIBarButtonItem()
        leftButton.setIcon(icon: .ionicons(.iosArrowBack), iconSize: 29, color: .red, cgRect: CGRect(x: 0, y: 3, width: 29, height: 29), target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setUpSpeaker(with speaker : Speaker) {
        self.speaker = speaker
        setUpDefaults()
        setUpTableView()
        tableView.allowsSelection = false;
    }
    
    func setUpDefaults() {
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("speakers", comment: "")
        self.navigationController?.navigationBar.tintColor = .red
        self.title = speaker!.name
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
            cell.setUpView(speaker!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let desc = speaker!.desc
//        if (desc.containsChineseCharacters) {
//
//        }
        return CGFloat(350 + speaker!.desc.dynamicHeight(font: UIFont(font: .avenirNextRegular, size: 15)!, width: UIScreen.main.bounds.width - 70))
    }

}

extension String {
    var containsChineseCharacters: Bool {
        return self.range(of: "\\p{Han}", options: .regularExpression) != nil
    }
}
