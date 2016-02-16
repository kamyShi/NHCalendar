//
//  NHCalendarView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/15.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let topView = NHCalendarTopView()
        self.topView = topView
        self.addSubview(topView)
        
        let contentView = NHCalendarContentView()
        self.contentView = contentView
        self.contentView.delegate = self.topView
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
    
    //MARK:属性
    var topView     : NHCalendarTopView!
    var contentView : NHCalendarContentView!
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
