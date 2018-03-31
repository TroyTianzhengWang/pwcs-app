//
//  MainTabBarController.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SwiftIcons

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let agendaVC = AgendaVC()
        agendaVC.tabBarItem = UITabBarItem(title: NSLocalizedString("panels", comment: ""), image: UIImage.init(icon: .icofont(.lawyerAlt1), size: CGSize(width: 30, height: 30)), selectedImage: UIImage.init(icon: .icofont(.lawyerAlt1), size: CGSize(width: 30, height: 30), textColor: UIColor.red))
        let speakersVC = SpeakersVC()
        speakersVC.tabBarItem = UITabBarItem(title: NSLocalizedString("speakers", comment: ""), image: UIImage.init(icon: .icofont(.userAlt4), size: CGSize(width: 30, height: 30)), selectedImage: UIImage.init(icon: .icofont(.userAlt4), size: CGSize(width: 30, height: 30), textColor: UIColor.red))
        let schedulesVC = TimelinesVC()
        schedulesVC.tabBarItem = UITabBarItem(title: NSLocalizedString("schedule", comment: ""), image: UIImage.init(icon: .icofont(.calendar), size: CGSize(width: 30, height: 30)), selectedImage: UIImage.init(icon: .icofont(.calendar), size: CGSize(width: 30, height: 30), textColor: UIColor.red))
        let helpVC = HelpVC()
        helpVC.tabBarItem = UITabBarItem(title: NSLocalizedString("help", comment: ""), image: UIImage.init(icon: .icofont(.question), size: CGSize(width: 30, height: 30)), selectedImage: UIImage.init(icon: .icofont(.question), size: CGSize(width: 30, height: 30), textColor: UIColor.red))
        let tabBarList = [schedulesVC, agendaVC, speakersVC, helpVC]
        viewControllers = tabBarList
    }

}
