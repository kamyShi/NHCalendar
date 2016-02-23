//
//  ViewController.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/15.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NHCalendarViewDelegate {

    var calendar : NHCalendarView?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let view = NHCalendarView()
//        view.frame = CGRectMake(0, 100, self.view.bounds.size.width, 250)
//        view.titleColor = UIColor.blackColor()
//        view.delegate = self
//        self.view.addSubview(view)
        
        //类方法
//       self.calendar =  NHCalendarView.show(self.view, frame: CGRectMake(0, 100, self.view.bounds.size.width, 250)) { (year, month, day) -> Void in
//            print("\(year)-\(month)-\(day)")
//        }
        
        //遍历构造器用法
        self.calendar = NHCalendarView(frame: CGRectMake(0, 100, self.view.bounds.size.width, 250), view: self.view, selectDate: { (year, month, day) -> Void in
            print("\(year)-\(month)-\(day)")
        })
    }
    @IBAction func backClick(sender: UIButton) {
        /**
        回到今天
        */
        self.calendar?.backToDay()
    }
    //点击选择日期功能
    func NHCalendarViewSelectDate(year: Int, month: Int, day: Int) {
        print("\(year)-\(month)-\(day)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

