//
//  ViewController.swift
//  CLScrollPageView
//
//  Created by tusm on 2016/10/26.
//  Copyright © 2016年 cleven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //测试数据
        let titleArray:[String] = ["笑话","看看","笑到","手势","笑话","看看","笑到","手势"]
 
        var vcArray:[UIViewController] = [UIViewController]()
        for _ in 0..<titleArray.count {
            
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.cl_randomColor()
            
            vcArray.append(vc)
        }
        
        
        let pageView = CLScrollPageView(frame: CGRect(x: 0, y: 64, width: KScreenWidht, height: KScreenHeight))
        view.addSubview(pageView)
        //设置标题
        pageView.titleArray =  titleArray
        //设置view
        pageView.pageArray = vcArray
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

