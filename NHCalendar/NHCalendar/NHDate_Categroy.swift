//
//  NHDate_Categroy.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/15.
//  Copyright © 2016年 Niu. All rights reserved.

import UIKit

extension NSDate {
    /**
     获取这个月有多少天
     */
    func getMonthHowManyDay() -> Int {
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的数量
        return NSCalendar.currentCalendar().rangeOfUnit(.Day, inUnit:.Month, forDate: self).length
    }
    /**
     *  获取这个月第一天是星期几
     */
    func getMontFirstWeekDay() -> Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = NSCalendar.currentCalendar()
        //这里注意 swift要用[,]这样方式写
        let com = calendar.components([.Year,.Month,.Day], fromDate: self)
        //设置成第一天
        com.day = 1
        let date = calendar.dateFromComponents(com)
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的位置  ordinalityOfUnit
        let firstWeekDay = calendar.ordinalityOfUnit(.Weekday, inUnit: .WeekOfMonth, forDate: date!)
        return firstWeekDay - 1
    }
    /**
     获取指定时间下一个月的时间
     */
    func getNextDate() ->NSDate {
        let calendar = NSCalendar.currentCalendar()
        let com = calendar.components([.Year,.Month,.Day], fromDate: self)
        com.month += 1
        return calendar.dateFromComponents(com)!
    }
    /**
     获取指定时间上一个月的时间
     */
    func getLastDate() ->NSDate {
        let calendar = NSCalendar.currentCalendar()
        let com = calendar.components([.Year,.Month,.Day], fromDate: self)
        com.month -= 1
        return calendar.dateFromComponents(com)!
    }
    
}

