//
//  TimelinesVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 3/19/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import PagingMenuController
private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private var viewController1 = CustomScheduleVC()
    private var viewController2 = CustomScheduleVC()
    private var viewController3 = CustomScheduleVC()
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        if #available(iOS 11.0, *) {
            let vc1 = ScheduleVC()
            let vc2 = ScheduleVC()
            let vc3 = ScheduleVC()
            vc1.setUpDay(day: 0)
            vc2.setUpDay(day: 1)
            vc3.setUpDay(day: 2)
            return [vc1, vc2, vc3]
        } else {
            viewController1.setUpDay(day: 0)
            viewController2.setUpDay(day: 1)
            viewController3.setUpDay(day: 2)
            return [viewController1, viewController2, viewController3]
        }
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3()]
        }
        var backgroundColor: UIColor {
            return UIColor.white
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 2, color: UIColor.red, horizontalPadding: 10, verticalPadding: 1)
        }
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: NSLocalizedString("friday", comment: "")))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: NSLocalizedString("saturday", comment: "")))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: NSLocalizedString("sunday", comment: "")))
        }
    }
}


class TimelinesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red]
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += options.getLayoutHeight()
        pagingMenuController.view.frame.size.height -= options.getLayoutHeight()
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let formatString = NSLocalizedString("schedule",
                                             comment: "My Schedule is Cool")
        navigationController?.navigationBar.topItem?.title = formatString
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.black
        ]
    }

}
