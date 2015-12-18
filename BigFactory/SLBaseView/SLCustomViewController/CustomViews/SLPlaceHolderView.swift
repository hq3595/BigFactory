//
//  SLPlaceHolderView.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

enum SLPlaceHolderViewType:NSInteger{
    case Error = 0
    case MainPage
    case Default
}

let kImageViewOriginY =  68
let kImageViewWidth  =   50
let kImageViewHeight  =  61
let kImageLabelPadding = 10
let kLabelMaxWidth    =  ScreenWidth - 100
let kButtonWidth    =    150
let kButtonHeight     =  40
let kDescFont        =   SLFont.sl_S7()
let kDescColor      =    SLColor.sl_subcontent_color()
let kButtonFont    =     SLFont.sl_S4()

class SLPlaceHolderView: UIView {
    var placeholderType:SLPlaceHolderViewType?
    var placeHolderLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initSubViews(){
        self.placeHolderLabel = UILabel.init(frame: CGRectZero)
        self.placeHolderLabel.backgroundColor = UIColor.clearColor()
        self.placeHolderLabel.textColor = kDescColor
        self.placeHolderLabel.font = kDescFont
        self.placeHolderLabel.numberOfLines = 0
        self.placeHolderLabel.textAlignment = .Center
        self.addSubview(self.placeHolderLabel)
    }
    
    func layoutContent(){
        let size:CGRect = NSString.getStringSizeWithString((self.placeHolderLabel.text)!, font: kDescFont, sizeMake: CGSizeMake(kLabelMaxWidth, CGFloat.max))
         self.placeHolderLabel.frame = CGRectMake(0, 0, kLabelMaxWidth, size.height )
        self.placeHolderLabel.center = self.center
    }
    
    func setPlaceholderWithType(placeholderType:SLPlaceHolderViewType){
        self.placeholderType = placeholderType
        switch (placeholderType){
        case .Error:
            self.placeHolderLabel.text = "哇哦，竟然加载失败了，少侠你确定网络正常嘛，要不再下拉刷新一下试试看？"
        case .MainPage:
            self.placeHolderLabel.text = "我已用尽全身力气，可惜还是没能得到你"
        case .Default:
            self.placeHolderLabel.text = "没加载到数据是神马情况？！"
        }
        layoutContent()
    }
    
    func refreshContent(){
        layoutContent()
    }
    
}
