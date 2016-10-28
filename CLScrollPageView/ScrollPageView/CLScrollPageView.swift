//
//  CLScrollPageView.swift
//  CLScrollPageView
//
//  Created by cleven on 2016/10/22.
//  Copyright © 2016年 cleven. All rights reserved.
//

import UIKit

class CLScrollPageView: UIView {

    //MARK: 私有属性
    fileprivate var selectButton:UIButton = UIButton()
    //设置标题
    fileprivate var titleArray:[String]
    //设置页面
    fileprivate var pageArray:[UIViewController]
    
    //MARK: 构造方法
    
    init(frame:CGRect,titleArray:[String],pageArray:[UIViewController]){
        self.titleArray = titleArray
        self.pageArray = pageArray
        
        super.init(frame: frame)
        
        setupUI()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 懒加载
    fileprivate lazy var titleScrollView:UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width , height: 40))
    
    
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
        pageScrollView.frame = CGRect(x: 0, y: maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - maxY)
        pageScrollView.showsHorizontalScrollIndicator = true
        pageScrollView.isPagingEnabled = true
        pageScrollView.delegate = self
        pageScrollView.bounces = false
        addSubview(pageScrollView)
    

        //MARK: 设置数据
        let margin:CGFloat = 10
        var width:CGFloat = 0
        
        //计算titleArray文字的宽度
        var textWidth:CGFloat = 0
        let textFont:CGFloat = 17.5 //17号字宽度17.5
        for str in titleArray {
            textWidth += CGFloat(str.characters.count) * textFont + margin * 2
        }
        for i in (0..<titleArray.count){
            //title
            let titleButton:UIButton = UIButton(title: titleArray[i], titleColor: UIColor.black)
            titleScrollView.addSubview(titleButton)
            titleButton.addTarget(self, action: #selector(self.titleButtonClick(button:)), for: .touchUpInside)
            
            //判断传进的title文字宽度,设置frame
            if (textWidth < UIScreen.main.bounds.width) {
                
                titleButton.frame = CGRect(x: width , y: 5.0, width: UIScreen.main.bounds.width / CGFloat(titleArray.count), height: 40)
                width += titleButton.bounds.size.width
            }else{
                
                titleButton.frame = CGRect(x: width , y: 5.0, width: titleButton.bounds.size.width + margin, height: 40)
                width += titleButton.bounds.size.width + margin
            }
            
            titleButton.tag = i + 1000
            
            //默认选中第一个
            if i == 0 {
                titleButtonClick(button: titleButton)
            }
            
            //页面
            let vc:UIViewController = pageArray[i]
            pageScrollView.addSubview(vc.view)
            vc.view.frame = bounds.offsetBy(dx: CGFloat(i) * UIScreen.main.bounds.width, dy: 0)
        }
        
        
        titleScrollView.contentSize = CGSize(width: Int(width), height: 0)
        pageScrollView.contentSize = CGSize(width: pageArray.count * Int(UIScreen.main.bounds.width), height: 0)
        
        
    }
    
    //MARK: 监听方法
    @objc private func titleButtonClick(button:UIButton){
        
        selectButton.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        selectButton = button
        
        //滚动到指定的位置
        pageScrollView.setContentOffset(CGPoint(x: (button.tag - 1000) * Int(UIScreen.main.bounds.width), y: 0), animated: true)
        
        setUptitleButtonCenter(button: button)
        
    }
    
    //设置标题按钮居中
    fileprivate func setUptitleButtonCenter(button:UIButton){
        
        var offsetX:CGFloat = button.center.x - UIScreen.main.bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        
        //最大的偏移量
        let maxX:CGFloat = titleScrollView.contentSize.width - UIScreen.main.bounds.width
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
