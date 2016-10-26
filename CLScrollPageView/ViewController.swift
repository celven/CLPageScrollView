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
        var vcArray:[UIViewController] = [UIViewController]()
        for _ in 0..<12 {
            
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.cl_randomColor()
            
            vcArray.append(vc)
        }
        
        
        let pageView = CLScrollPageView(frame: CGRect(x: 0, y: 64, width: KScreenWidht, height: KScreenHeight))
        view.addSubview(pageView)
        //设置标题
        pageView.titleArray =  ["笑话","呵呵大神大神的","看看","笑话","呵呵","看看","笑话","呵呵","看看打的的","笑话","呵呵","看看",]
        //设置view
        pageView.pageArray = vcArray
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

