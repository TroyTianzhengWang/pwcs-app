//
//  EventsVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class EventsVC: UIViewController {
    
    let cellId = "cellId"
    
    var eventsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    func setupController() {
        view.addSubview(eventsView)
        eventsView.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view).offset(-50)
        }
        eventsView.delegate = self
        eventsView.dataSource = self
        eventsView.register(EventCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}

extension EventsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? EventCell {
            let event = Event(name: "Social Party", location: "Ritz Carton", time: "10PM - 11:20PM | Saturday", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", background: #imageLiteral(resourceName: "event-bg"))
            cell.setUpView(with: event)
            return cell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventVC = EventVC()
        navigationController?.pushViewController(eventVC, animated: true)
    }
    
}

extension EventsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 60, height: 200)
    }
    
}
