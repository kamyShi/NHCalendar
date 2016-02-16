//
//  NHCalendarContentView.swift
//  NHCalendar
//
//  Created by 牛辉 on 16/2/16.
//  Copyright © 2016年 Niu. All rights reserved.
//

import UIKit

class NHCalendarContentView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    // MARK: collection代理
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 44
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WorkHomeTopCell", forIndexPath: indexPath)
        return cell
    }
    // MARK: 懒加载
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        view.delegate = self;
        view.dataSource=self;
        // 注册cell
        view.registerNib(UINib(nibName: "WorkHomeTopCell", bundle:nil), forCellWithReuseIdentifier: "WorkHomeTopCell")
        view.pagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        layout.scrollDirection=UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing=0
        layout.minimumLineSpacing=0
        return view
    }()
    //MARK: 布局
    override func layoutSubviews() {
        self.collectionView.frame = self.bounds
        let W = self.bounds.size.width / CGFloat(7)
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSizeMake(W, W);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
