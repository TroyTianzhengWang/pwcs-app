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
    }
    
    func setUpSpeaker(with speaker : Speaker) {
        self.speaker = speaker
        setUpDefaults()
        setUpTableView()
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
        return getCellHeight(desc: speaker!.desc);
    }
    
    private func getCellHeight(desc: String) -> CGFloat {
        let screenWidth:CGFloat = UIScreen.main.bounds.width
        let descLength = CGFloat(desc.count)
        var numberOfCharacters = CGFloat(1.0)
        if (desc.containsChineseCharacters) {
            if (descLength > 420) {
                numberOfCharacters = CGFloat(screenWidth / 20)
            } else {
                numberOfCharacters = CGFloat(screenWidth / 25)
            }
        } else {
            if (descLength > 300) {
                numberOfCharacters = CGFloat(screenWidth / 10)
            } else {
                numberOfCharacters = CGFloat(screenWidth / 12)
            }
        }
        if (screenWidth < 350) {
            if (desc.containsChineseCharacters) {
                return CGFloat(290 + descLength / numberOfCharacters * 20) + 20
            } else {
                return CGFloat(290 + descLength / numberOfCharacters * 20) + 50
            }
        }
        return CGFloat(290 + descLength / numberOfCharacters * 20)
    }
    
    
}

extension String {
    var containsChineseCharacters: Bool {
        return self.range(of: "\\p{Han}", options: .regularExpression) != nil
    }
}
