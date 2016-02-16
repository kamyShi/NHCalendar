//
//  NHCalendarCell.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(self.collectionView)
    }
    var date : NSDate? {
        didSet {
           getData(date!)
        }
    }
    func getData(date : NSDate) {
        self.MothFirstDay = date.getMontFirstWeekDay()
        self.MothLenght = date.getMonthHowManyDay()
        self.collectionView.reloadData()
    }
    // MARK: collection代理
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NHCalendarItemCell", forIndexPath: indexPath) as! NHCalendarItemCell
        if indexPath.row >= self.MothFirstDay && indexPath.row <= self.MothLenght+self.MothFirstDay-1 {
            cell.label.text = "\(indexPath.row - self.MothFirstDay + 1)"
//            cell.bgView.hidden = false
        } else {
            cell.label.text = ""
//            cell.bgView.hidden = true
        }
        return cell
    }
    //MARK: 布局
    override func layoutSubviews() {
        self.collectionView.frame = self.bounds
        let W : CGFloat = (self.bounds.size.width-7)/7
        let H : CGFloat = (self.bounds.size.height-6)/6
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSizeMake(W, H);
    }
    // MARK: 懒加载
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        view.delegate = self;
        view.dataSource=self;
        // 注册cell
        view.registerNib(UINib(nibName: "NHCalendarItemCell", bundle:nil), forCellWithReuseIdentifier: "NHCalendarItemCell")
        view.pagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor.whiteColor()
        layout.scrollDirection = .Vertical
        layout.minimumInteritemSpacing=1
        layout.minimumLineSpacing=1
        return view
    }()
    //MARK: 属性
    var MothLenght = 0
    var MothFirstDay = 0

}
