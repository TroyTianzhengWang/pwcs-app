//
//  PanelsVC.swift
//  pwcs
//
//  Created by Zhilei Zheng on 2018/1/15.
//  Copyright © 2018年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit

class PanelsVC: UIViewController {
    
    let cellId = "cellId"
    
    var panelsView: UICollectionView = {
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
        view.addSubview(panelsView)
        panelsView.snp.makeConstraints {(make) -> Void in
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view).offset(-50)
        }
        panelsView.delegate = self
        panelsView.dataSource = self
        panelsView.register(PanelCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}

extension PanelsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PanelCell {
            let panel = Panel(name: "Social Responsibility", location: "Annenburg Theatre", time: "10AM - 11:20AM | Saturday", background: #imageLiteral(resourceName: "panel-social"))
            cell.setUpView(with: panel)
            return cell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let panelVC = PanelVC()
        present(panelVC, animated: true, completion: nil)
    }
    
}

extension PanelsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 60, height: 200)
    }
    
}
