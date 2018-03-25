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
    var speakers = [Speaker]()
    
    var panelsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setPanelType(with panelType : PanelType) {
        self.speakers = DataServices.shared.getSpeakers(for: panelType)
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
        return speakers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SpeakerCell {
            cell.setUpView(with: speakers[indexPath.row])
            return cell
        }
        return SpeakerCell();
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let speakerVC = SpeakerVC()
        speakerVC.setUpSpeaker(with: speakers[indexPath.row])
        navigationController?.pushViewController(speakerVC, animated: true)
    }
    
}

extension SpeakersListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 50, height: 200)
    }
    
}
