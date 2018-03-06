//
//  SpeakersVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private let viewController1 = SpeakersListVC()
    private let viewController2 = SpeakersListVC()
    private let viewController3 = SpeakersListVC()
    private let viewController4 = SpeakersListVC()
    private let viewController5 = SpeakersListVC()
    private let viewController6 = SpeakersListVC()
    private let viewController7 = SpeakersListVC()
    private let viewController8 = SpeakersListVC()
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        return [viewController1, viewController2, viewController3, viewController4, viewController5, viewController6, viewController7, viewController8]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .flexible, scrollingMode: .scrollEnabled)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4(), MenuItem5(), MenuItem6(), MenuItem7(), MenuItem8()]
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
            return .text(title: MenuItemText(text: "Openning"))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Finance"))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "International Relations"))
        }
    }
    fileprivate struct MenuItem4: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Real Estate"))
        }
    }
    fileprivate struct MenuItem5: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Technology"))
        }
    }
    fileprivate struct MenuItem6: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Entertainment"))
        }
    }
    fileprivate struct MenuItem7: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Social"))
        }
    }
    fileprivate struct MenuItem8: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Closing"))
        }
    }
}

class SpeakersVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Speakers"
    }
}


