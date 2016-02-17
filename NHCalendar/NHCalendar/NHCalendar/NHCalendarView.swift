//
//  NHCalendarView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/15.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit
@objc protocol NHCalendarViewDelegate {
    /**
     点击选择的日期 可选的
     */
   optional func NHCalendarViewSelectDate(year:Int,month:Int,day:Int)
}

class NHCalendarView: UIView ,NHCalendarContentViewDelegate{
    override init(frame: CGRect) {
        super.init(frame: frame)
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: selectDate)
        let topView = NHCalendarTopView()
        self.topView = topView
        self.addSubview(topView)
        
        let contentView = NHCalendarContentView()
        self.contentView = contentView
        self.contentView.delegate = self
        self.addSubview(contentView)
    }
    //MARK:布局
    override func layoutSubviews() {
        self.topView.frame.size.width = self.frame.size.width
        self.topView.frame.size.height = 50
        
        self.contentView.frame.origin.y = 50
        self.contentView.frame.size.width = self.frame.size.width
        self.contentView.frame.size.height = self.frame.size.height - 50
    }
    //MARK:     NHCalendarContentViewDelegate
    func calendarContentViewCurrentDate(date: NSDate) {
        self.topView.titleLabel.text = date.getTimeYYYY_MM()
    }
    func calendarContemViewSelectDate(year: Int, month: Int, day: Int) {
        self.delegate?.NHCalendarViewSelectDate?(year, month: month, day: day)
    }
    //MARK:属性
    var topView     : NHCalendarTopView!
    var contentView : NHCalendarContentView!
    var delegate    : NHCalendarViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
