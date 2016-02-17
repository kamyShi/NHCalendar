//
//  NHCalendarItemCell.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit
class NHCalendarItemCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var day : Int? {
        didSet {
            label.text = "\(day!)"
            if date!.isThisMonth() {
                if day == NSDate().getDay() {
                    label.textColor = UIColor.redColor()
                } else {
                    label.textColor = UIColor.blackColor()
                }
            } else {
                label.textColor = UIColor.blackColor()
            }
            let selectdate = NSUserDefaults.standardUserDefaults().objectForKey(selectDate) as? NSDate
            if selectdate == nil {
                return
            }
            if date!.isEqualMonth(selectdate!) {
                if day == selectdate!.getDay() {
                    bgView.backgroundColor = UIColor.orangeColor()
                } else {
                    bgView.backgroundColor = UIColor.whiteColor()
                }
            } else {
                bgView.backgroundColor = UIColor.whiteColor()
            }
        }
    }
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var label: UILabel!
    var date : NSDate?
}
