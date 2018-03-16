//
//  SpeakersListVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit

class SpeakersListVC: UIViewController {
    
    let cellId = "cellId"
    
    var panelsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    func setupController() {
        view.addSubview(panelsView)
        panelsView.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(self.view).offset(25)
            make.right.equalTo(self.view).offset(-25)
            make.top.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view).offset(-50)
        }
        panelsView.delegate = self
        panelsView.dataSource = self
        panelsView.register(SpeakerCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}

extension SpeakersListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SpeakerCell {
            let speaker = Speaker(name: "Chen Man", desc: "CEO of Leijun Photographer", img: #imageLiteral(resourceName: "manchen"))
            cell.setUpView(with: speaker)
            return cell
        }
        return SpeakerCell();
    }
    
}

extension SpeakersListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 50, height: 200)
    }
    
}
