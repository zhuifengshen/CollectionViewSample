//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by 张楚昭 on 16/5/17.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    //奥运赛事
    var events:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = NSBundle.mainBundle().pathForResource("events", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.events = NSArray(contentsOfFile: plistPath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //实现UICollectionViewDataSource协议的方法
    //提供视图中节的个数
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.events.count / 2
    }
    //提供某个节中的列数目
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    //为单元格提供显示数据
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Cell
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary
        cell.nameLabel.text = event["name"] as? String
        cell.imageView.image = UIImage(named: event["image"] as! String)
        return cell
    }
    //实现UICollectionViewDelegate协议的方法
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary
        NSLog("Select event name:%@",event["name"] as! String)
    }
    
}

