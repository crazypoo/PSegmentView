//
//  PSegmentView.swift
//  PSegmentView
//
//  Created by 邓杰豪 on 2016/9/18.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

protocol PSegmentViewDegelate {
    func didSelectedSegmentAtIndex(index:NSInteger)
}

class PSegmentView: UIView {
    var delegate:PSegmentViewDegelate?
    var titlesArray:NSArray?
    var selectedButton:UIButton?
    var nColor:UIColor?
    var sColor:UIColor?
    var titleF:UIFont?
    var sLine:Bool?
    var lColor:UIColor?
    var lWidth:CGFloat?

    init(frame:CGRect,titles:NSArray,titleNormalColor:UIColor,titleSelectedColor:UIColor,titleFont:UIFont,setLine:Bool,lineColor:UIColor,lineWidth:CGFloat) {
        super.init(frame: frame)
        titlesArray = titles
        nColor = titleNormalColor
        sColor = titleSelectedColor
        titleF = titleFont
        sLine = setLine
        lColor = lineColor
        lWidth = lineWidth
        initUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initUI()
    {
        for i in 0 ..< (titlesArray?.count)!
        {
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect.init(x: self.frame.size.width / CGFloat((titlesArray?.count)! * i) , y: 0, width: self.frame.size.width / CGFloat((titlesArray?.count)!), height: self.frame.size.height)
            btn.tag = i
            btn.setTitleColor(nColor, for: .normal)
            btn.setTitleColor(sColor, for: .selected)
            btn.titleLabel?.font = titleF
            btn.setTitle(titlesArray?.object(at: i) as! String?, for: .normal)
            self.addSubview(btn)
            if i == 0
            {
                btnTap(sender: btn)
            }
        }

        if sLine == true
        {
            let a = 1
            let b = titlesArray?.count
            _ = b! - a
            for c in 0 ..< (titlesArray?.count)!
            {
                let line = UIView.init(frame: CGRect.init(x: self.frame.size.width / CGFloat((titlesArray?.count)! * c) - lWidth! / 2, y: 0, width: lWidth!, height: self.frame.size.height))
                line.backgroundColor = lColor
                self.addSubview(line)
            }
        }
    }

    func btnTap(sender:UIButton)
    {
        if selectedButton == sender
        {
            return
        }

        selectedButton?.isSelected = false
        sender.isSelected = true
        if delegate != nil
        {
            delegate?.didSelectedSegmentAtIndex(index: sender.tag)
        }
    }
}
