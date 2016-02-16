//
//  NHCalendarTopView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarTopView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        let arr = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        for title in arr {
            self.createLabel(title)
        }
    }

    func createLabel(title : String) {
        let label = UILabel()
        label.text = title
        label.font = UIFont.fontWithSize(13)
        label.textAlignment = .Center
        self.addSubview(label)
    }
    
    override func layoutSubviews() {
        let count = self.subviews.count
        let W = self.frame.size.width / CGFloat(count)
        for var i = 0 ; i<count ; i++ {
            let view = self.subviews[i]
            view.frame.size.width = W
            view.frame.size.height = self.frame.size.height
            view.frame.origin.x = W * CGFloat(i)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
