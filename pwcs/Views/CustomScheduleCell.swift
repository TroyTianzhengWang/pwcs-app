//
//  CustomScheduleCell.swift
//  pwcs
//
//  Created by Zhilei Zheng on 4/6/18.
//  Copyright © 2018 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit
import UIFontComplete

class CustomScheduleCell: UITableViewCell {
    
    var timeLabel = UILabel()
    var descLabel = UILabel()
    
    var lineLayer:CALayer = CALayer()
    
    func setUpView(time:String, desc:String, isFirst:Bool) {
        self.clipsToBounds = true
        self.addSubview(timeLabel)
        self.addSubview(descLabel)
        timeLabel.text = time
        timeLabel.font = UIFont(font: .avenirNextRegular, size: 16)
        timeLabel.textColor = .red
        timeLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(60)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(17)
        }
        descLabel.text = desc
        descLabel.font = UIFont(font: .avenirNextRegular, size: 15)
        descLabel.numberOfLines = 0
        descLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(timeLabel.snp.bottom).offset(5)
            make.left.equalTo(self).offset(60)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
        }
        var start = CGPoint(x: 35, y: 0)
        if (isFirst) {
            start = CGPoint(x: 35, y: 22)
        }
        let end = CGPoint(x: 35, y: 800)
        addLine(fromPoint: start, toPoint: end)
        drawRingFittingInsideView()
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint, color:UIColor = UIColor.black, width:Int = 2) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = CGFloat(width)
        line.lineJoin = kCALineJoinRound
        lineLayer = line
        self.layer.addSublayer(line)
    }
    
    func redrawLine() {
        lineLayer.removeFromSuperlayer()
        let top = CGPoint(x: 35, y: 0)
        let start = CGPoint(x: 35, y: 22)
        let end = CGPoint(x: 35, y: 800)
        addLine(fromPoint: top, toPoint: end, color: UIColor.white, width: 5)
        addLine(fromPoint: start, toPoint: end)
        drawRingFittingInsideView()
    }
    
    func drawRingFittingInsideView() {
        let halfSize:CGFloat = CGFloat(6)
        let desiredLineWidth:CGFloat = CGFloat(6)    // your desired value
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:35,y:22),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(0),
            endAngle:CGFloat(CGFloat.pi * 2),
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        
        self.layer.addSublayer(shapeLayer)
    }

}
