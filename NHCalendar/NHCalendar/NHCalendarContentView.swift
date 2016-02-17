//
//  NHCalendarContentView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit
protocol NHCalendarContentViewDelegate {

    func calendarContentViewCurrentDate(date : NSDate)

}
class NHCalendarContentView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {

    var MothLenght = 0
    var MothFirstDay = 0
    var dataArr = NSMutableArray()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        getData(NSDate())
    }
    func getData(date : NSDate) {
        self.dataArr.removeAllObjects()
        self.dataArr.addObjectsFromArray(NHDateTool.getRecentDate(date) as [AnyObject])
        let currentIndexPathReset = NSIndexPath(forItem: 2, inSection: 0)
        self.collectionView.scrollToItemAtIndexPath(currentIndexPathReset, atScrollPosition: .Left, animated: false)
        self.delegate?.calendarContentViewCurrentDate(self.dataArr[2] as! NSDate)
        self.collectionView.reloadData()
    }
    // MARK: collection代理
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NHCalendarCell", forIndexPath: indexPath) as! NHCalendarCell
        let date = self.dataArr[indexPath.row] as! NSDate
        cell.date = date
        return cell
    }
    // MARK: scroll代理
    /**当用户即将开始拖拽的时候就调用*/
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewDidEndDragging--开始")
    }
    /**当用户停止拖拽的时候就调用*/
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging--松开")
    }
    /**停止滚动的时候*/
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDragging--结束")
        self.getData(self.resetIndexPath())
    }
    func resetIndexPath() -> NSDate {
        // 当前正在展示的位置
        let  currentIndexPath = self.collectionView.indexPathsForVisibleItems().first
        return self.dataArr[(currentIndexPath?.row)!] as! NSDate;
    }
    //MARK: 布局
    override func layoutSubviews() {
        self.collectionView.frame = self.bounds
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        let currentIndexPathReset = NSIndexPath(forItem: 2, inSection: 0)
        self.collectionView.scrollToItemAtIndexPath(currentIndexPathReset, atScrollPosition: .Left, animated: false)
    }
    // MARK: 懒加载
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        view.delegate = self;
        view.dataSource=self;
        // 注册cell
        view.registerNib(UINib(nibName: "NHCalendarCell", bundle:nil), forCellWithReuseIdentifier: "NHCalendarCell")
        view.pagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor.whiteColor()
        layout.scrollDirection = .Horizontal
        layout.minimumInteritemSpacing=0
        layout.minimumLineSpacing=0
        return view
    }()
    var delegate : NHCalendarContentViewDelegate?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
