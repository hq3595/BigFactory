//
//  SLTableViewCell.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

let kSLTableViewCellDefaultLeftPadding:CGFloat = 56
let kSLTableViewCellDefaultRightPadding:CGFloat  = 0

class SLTableViewCellData:NSObject{
    var showBottomLine = true
    var showTopLine = false
    var hasIcon = false
    var lineLeftPadding = CGFloat()
    var lineRightPadding = CGFloat()
    var showIndicator = false
    var cellHeight = CGFloat()
    
    override init() {
        super.init()
        showBottomLine = true
        showTopLine = false
        hasIcon = false
        showIndicator = false
        lineLeftPadding = 16
        lineRightPadding = 0
    }
}

class SLTableViewCell: UITableViewCell {
    
    var cellData = SLTableViewCellData()
    var indictorImage : UIImageView!
    var topLine : UIImageView!
    var bottomLine : UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        self.contentView.backgroundColor = SLColor.sl_cellbackground()
        self.selectionStyle = .Gray
        
        self.topLine = UIImageView.sl_seperateLineWidth(ScreenWidth)
        self.contentView.addSubview(self.topLine)
        
        self.bottomLine = UIImageView.sl_seperateLineWidth(ScreenWidth - kSLTableViewCellDefaultLeftPadding - kSLTableViewCellDefaultRightPadding)
        self.contentView.addSubview(bottomLine)
        
        self.indictorImage = UIImageView.init(frame: CGRectMake(0, 0, 10, 10))
        self.indictorImage.backgroundColor = UIColor.clearColor()
        self.indictorImage.image = UIImage(named: "arrow_gray_right")
        self.contentView.addSubview(self.indictorImage)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpCellData(data:SLTableViewCellData){
        cellData = data
        if(cellData.showTopLine == true){
            topLine.hidden = false
            topLine.frame = CGRectMake(0, 0, self.width(), 0.5)
        }else{
            topLine.hidden = true
        }
        
        if(cellData.showBottomLine == true){
            bottomLine.hidden = false
            bottomLine.frame = CGRectMake((cellData.lineLeftPadding), self.height() - 0.5, self.width() - (cellData.lineLeftPadding) - (cellData.lineRightPadding), 0.5)
        }else{
            bottomLine.hidden = true
        }
        
        if(cellData.showIndicator == true){
            indictorImage.hidden = false
            indictorImage.frame = CGRectMake(self.right() - 15 - 10, (self.height() - 10)/2, 10, 10)
        }else{
            indictorImage.hidden = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func contentEditing()->Bool{
        return false
    }
}
