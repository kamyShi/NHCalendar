//
//  NHCalendarContentView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarContentView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {

    var MothLenght = 0
    var MothFirstDay = 0
    var dataArr = NSMutableArray()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        getData()
    }
    func getData() {

        self.dataArr.addObjectsFromArray(NHDateTool.getRecentDate(NSDate()) as [AnyObject])
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
    //MARK: 布局
    override func layoutSubviews() {
        self.collectionView.frame = self.bounds
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
