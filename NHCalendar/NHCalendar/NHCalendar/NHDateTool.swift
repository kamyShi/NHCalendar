//
//  NHDateTool.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHDateTool: NSObject {
    /**
     获取指定时间 前后各2个月的时间数组
     */
    class func getRecentDate(date : NSDate) ->NSArray {
        
        return [date.getLastDate().getLastDate(),date.getLastDate(),date,date.getNextDate(),date.getNextDate().getNextDate()]
    }

}
