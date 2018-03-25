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
    
    var events = [Event]()
    
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
        events = DataServices.shared.getEvents()
        eventsView.reloadData()
    }
    
}

extension EventsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? EventCell {
            cell.setUpView(with: events[indexPath.row])
            return cell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventVC = EventVC()
        eventVC.setEvent(events[indexPath.row])
        navigationController?.pushViewController(eventVC, animated: true)
    }
    
}

extension EventsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 60, height: 200)
    }
    
}
