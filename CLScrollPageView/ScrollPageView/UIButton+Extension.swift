//
//  UIButton+Extension.swift
//  swift-test
//
//  Created by cleven on 2016/10/15.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// UIButton
    ///
    /// - parameter setBackgroundImage: backgroundImage 默认为nil
    /// - parameter title:              文字
    /// - parameter titleColor:         文字颜色
    /// - parameter fontSize:           字体大小
    /// - parameter setImage:           image
    ///
    /// - returns: UIButton
    convenience init(setBackgroundImage:String? = nil,title:String?,titleColor:UIColor?,fontSize:CGFloat? = 17,setImage:String? = nil){
        self.init()
        
        if let setBackgroundImage = setBackgroundImage{
            
            self.setBackgroundImage(UIImage(named:setBackgroundImage), for: .normal)
            
        }
        if let setImage = setImage{
            
            self.setImage(UIImage(named:setImage), for: .normal)
            
        }
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize!)
        
        sizeToFit()
        
    }
    
    
}
