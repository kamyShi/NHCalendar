//
//  NHCalendarTopView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarTopView: UIView {
    
    var titleLabel : UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        let arr = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        for title in arr {
            self.createLabel(title)
        }
        let title = UILabel()
        title.text = NSDate().getTimeYYYY_MM()
        title.textAlignment = .Center
        self.addSubview(title)
        self.titleLabel = title
    }
    func createLabel(title : String) {
        let label = UILabel()
        label.text = title
        label.font = UIFont.fontWithSize(13)
        label.textColor = UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0)
        label.textAlignment = .Center
        self.addSubview(label)
    }
    override func layoutSubviews() {
        let count = self.subviews.count
        let W = self.frame.size.width / CGFloat(count-1)
        for var i = 0 ; i<count ; i++ {
            let view = self.subviews[i]
            if view == self.titleLabel {
                view.frame.size.width = self.frame.size.width
                view.frame.size.height = self.frame.size.height/2
            } else {
                view.frame.size.width = W
                view.frame.size.height = self.frame.size.height/2
                view.frame.origin.x = W * CGFloat(i)
                view.frame.origin.y = 20
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
