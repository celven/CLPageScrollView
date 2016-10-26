//
//  CLScrollPageView.swift
//  CLScrollPageView
//
//  Created by cleven on 2016/10/22.
//  Copyright © 2016年 cleven. All rights reserved.
//

import UIKit
//MARK: 公共属性
let KScreenWidht:CGFloat = UIScreen.main.bounds.width
let KScreenHeight:CGFloat = UIScreen.main.bounds.height

class CLScrollPageView: UIView {
    
    //MARK: 公共属性
    //设置标题
    var titleArray:[String]?
    //设置页面
    var pageArray:[UIViewController]?{
        didSet{
            setupUI()
        }
    }
    
    
    
    //MARK: 私有属性
    fileprivate var selectButton:UIButton = UIButton()
    
    //MARK: 构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 懒加载
    fileprivate lazy var titleScrollView:UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width:KScreenWidht , height: 40))
    
    
    fileprivate lazy var pageScrollView:UIScrollView = UIScrollView(frame: .zero)
    
}

extension CLScrollPageView {
    
    //初始化UI
    fileprivate func setupUI(){
        backgroundColor = UIColor.white
        
        //titleScrollView
        titleScrollView.backgroundColor = UIColor.darkGray
        titleScrollView.showsHorizontalScrollIndicator = false
        titleScrollView.bounces = false
        addSubview(titleScrollView)
        
        //pageScrollView
        let maxY = titleScrollView.frame.maxY
        pageScrollView.frame = CGRect(x: 0, y: maxY, width: KScreenWidht, height: KScreenHeight - maxY)
        pageScrollView.showsHorizontalScrollIndicator = true
        pageScrollView.isPagingEnabled = true
        pageScrollView.delegate = self
        pageScrollView.bounces = false
        addSubview(pageScrollView)
        
        
        guard let titleArray = titleArray else {
            return
        }
        guard let pageArray = pageArray else {
            return
        }
        
        
        //MARK: 设置数据
        let margin:CGFloat = 10
        var width:CGFloat = 0
        for i in (0..<titleArray.count){
            //title
            let titleButton:UIButton = UIButton(title: titleArray[i], titleColor: UIColor.black)
            titleScrollView.addSubview(titleButton)
            print(titleButton.bounds.size.width)
            titleButton.addTarget(self, action: #selector(self.titleButtonClick(button:)), for: .touchUpInside)
            titleButton.frame = CGRect(x: width , y: 5.0, width: titleButton.bounds.size.width+margin, height: 40)
            width += titleButton.bounds.size.width
            titleButton.tag = i + 1000
            //默认选中第一个
            if i == 0 {
                titleButtonClick(button: titleButton)
            }
            
            //页面
            let vc:UIViewController = pageArray[i]
            pageScrollView.addSubview(vc.view)
            vc.view.frame = bounds.offsetBy(dx: CGFloat(i) * KScreenWidht, dy: 0)
        }
        
        
        titleScrollView.contentSize = CGSize(width: Int(width), height: 0)
        pageScrollView.contentSize = CGSize(width: pageArray.count * Int(KScreenWidht), height: 0)
        
        
    }
    
    //MARK: 监听方法
    @objc private func titleButtonClick(button:UIButton){
        
        selectButton.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        selectButton = button
        
        //滚动到指定的位置
        pageScrollView.setContentOffset(CGPoint(x: (button.tag - 1000) * Int(KScreenWidht), y: 0), animated: true)
        
        setUptitleButtonCenter(button: button)
        
    }
    
    //设置标题按钮居中
    fileprivate func setUptitleButtonCenter(button:UIButton){
        
        var offsetX:CGFloat = button.center.x - KScreenWidht * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        
        //最大的偏移量
        let maxX:CGFloat = titleScrollView.contentSize.width - KScreenWidht
        if offsetX > maxX {
            
            offsetX = maxX
        }
        
        titleScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
    
}

//MARK: scrollView代理方法
extension CLScrollPageView:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        
        let titleButton = self.viewWithTag(Int(page)+1000) as! UIButton
        selectButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.setTitleColor(UIColor.red, for: .normal)
        selectButton = titleButton
        
        //滚动标题居中
        setUptitleButtonCenter(button: titleButton)
    }
    
}
