//
//  SLPostPhotoCell.swift
//  BigFactory
//
//  Created by huangqiang on 12/10/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit
import Kingfisher

let PostCellIdentify = "Post_CELL"

protocol SLPostCellDelegate{
    func didClickedImageView(cell:SLPostCell,photoUrl:String,imageView:UIImageView)
}

class SLPostCellData:SLTableViewCellData {
    var containerFram = CGRectZero
    var titleFrame = CGRectZero
    var photoFrame = CGRectZero
    var gitTagFrame = CGRectZero
    var isShowGitTag = false
    var postTitle:String = ""
    var photoUrl:String = ""
    var _postInfo:SLPostInfoMD!  //这是一种swift 写法，用来保存变量的值
    var postInfo : SLPostInfoMD{
        set(postMD){
            _postInfo = postMD
            var originY:CGFloat = 10
            
            //设置title
            postTitle = postMD.postTitle!
            let size:CGRect = NSString.getStringSizeWithString(postTitle, font: kContentTextFont, sizeMake: CGSizeMake((ScreenWidth - 30), CGFloat.max))
            titleFrame = CGRectMake(10, originY, ScreenWidth - 30, size.height)
            originY = originY + size.height
            
            if(postMD.postUrl?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0){
                //设置图片
                photoUrl = postMD.postUrl!
                photoFrame = CGRectMake(10, originY + 10, 150, 170)
                //设置gif标
                gitTagFrame = CGRectMake(photoFrame.width - 55, photoFrame.height - 30, 44, 20)
                originY = originY + photoFrame.height + 10
                
                if(postMD.postType == BgPostType.Gif){
                    isShowGitTag = true
                }else{
                    isShowGitTag = false
                }
            }
            containerFram = CGRectMake(5, 0, ScreenWidth - 10, originY)
            self.cellHeight = originY
        }
        get{
            return _postInfo
        }
    }
}

class SLPostCell: SLTableViewCell {
    var textTitleLabel = UILabel()
    var photoImageView = UIImageView()
    var gifTagImageView = UIImageView()
    var containerView = UIView()
    
    var delegate : SLPostCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .None
        
        self.contentView.backgroundColor = SLColor.sl_bg_color()
        
        self.containerView.backgroundColor = UIColor.whiteColor()
        self.containerView.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.containerView.clipsToBounds = true
        contentView.addSubview(self.containerView)
        
        self.textTitleLabel.font = kContentTextFont
        self.textTitleLabel.textColor = SLColor.sl_content_color()
        self.textTitleLabel.textAlignment = .Left
        self.textTitleLabel.numberOfLines = 0
        self.containerView.addSubview(self.textTitleLabel)
        
        self.photoImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.photoImageView.clipsToBounds = true
        self.photoImageView.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: Selector("didClickedPhoto:"))
        self.photoImageView.addGestureRecognizer(gesture)
        self.containerView.addSubview(self.photoImageView)
        
        self.gifTagImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.gifTagImageView.clipsToBounds = true
        self.photoImageView.addSubview(self.gifTagImageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didClickedPhoto(sender:UITapGestureRecognizer){
        let cellData = self.cellData as! SLPostCellData
        self.delegate?.didClickedImageView(self, photoUrl: cellData.photoUrl, imageView: self.photoImageView)
    }
    
    override func setUpCellData(data: SLTableViewCellData) {
        super.setUpCellData(data)
        let cellData = data as! SLPostCellData
        self.containerView.frame = cellData.containerFram
        self.textTitleLabel.frame = cellData.titleFrame
        self.textTitleLabel.text = cellData.postTitle
        self.photoImageView.frame = cellData.photoFrame
        self.photoImageView.kf_showIndicatorWhenLoading = true
        self.photoImageView.kf_setImageWithURL(NSURL(string: cellData.photoUrl + "?imageMogr2/format/jpg/thumbnail/!50p")!,
            placeholderImage: nil,
            optionsInfo: [.TargetCache(imageCache)])
        self.gifTagImageView.frame = cellData.gitTagFrame
        self.gifTagImageView.image = UIImage(named: "gif_tag")
        
        self.gifTagImageView.hidden = !cellData.isShowGitTag
        
    }
}
