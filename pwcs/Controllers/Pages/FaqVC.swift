//
//  FaqVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import Savory
import SwiftHEXColors
import UIFontComplete

class FaqVC: UIViewController, SavoryViewDelegate {
    
    var questions: [(question: String, answer: String)] = [("Question 1", "Answer 1"), ("Question 2", "Answer 2")]
    
    var savoryView: SavoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 1. Initiate SavoryView */
        savoryView = SavoryView(frame: view.frame)
        // offset for status bar
        savoryView.frame.origin.y = 0
        savoryView.frame.size.height -= 20
        
        /* 2. Provide a implementation of SavoryStateProtivder protocol */
        // Savory providers a simple implementation - SimpleStateProvider
        savoryView.stateProvider = SimpleStateProvider([.collapsed, .collapsed])
        
        /* 3. Set the reuse identifiers for header and body cells */
        savoryView.headerIdentifier = "header"
        savoryView.bodyIdentifier = "body"
        
        /* 4. register the reuse identifiers */
        savoryView.register(UITableViewCell.self, forCellReuseIdentifier: "header")
        savoryView.register(UITableViewCell.self, forCellReuseIdentifier: "body")
        
        /* 5. set the savoryDelegate */
        savoryView.savoryDelegate = self
        
        /* 6. add subview */
        view.addSubview(savoryView)
    }
    
    func headerCell(forPanelAt index: SavoryPanelIndex, in savoryView: SavoryView) -> SavoryHeaderCell {
        
        /* Dequeues a reusable cell */
        // SavoryView provides a method to dequeue reusable header cell for certain index
        // SavoryView internally dequeues a cell using its headerIdentifier as reuse identifier
        let cell = savoryView.dequeueReusableHeaderCell(forPanelAt: index)
        
        /* customize the cell */
        cell.selectionStyle = .none
        cell.textLabel?.text = questions[index].question
        cell.textLabel?.font = UIFont(font: .avenirNextDemiBold, size: 16)
        cell.backgroundColor = UIColor.init(hex: 0xf5f5f5)
        
        return cell
    }
    
    func bodyCell(forPanelAt index: SavoryPanelIndex, in savoryView: SavoryView) -> SavoryBodyCell {
        
        // almost same as headerCell(forPanelAt:in:)
        let cell = savoryView.dequeueReusableBodyCell(forPanelAt: index)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(font: .avenirNextRegular, size: 14)
        cell.textLabel?.text = questions[index].answer
        return cell
    }
}
