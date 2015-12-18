//
//  SLTableViewController.swift
//  BigFactory
//
//  Created by huangqiang on 12/8/15.
//  Copyright © 2015 BigLaugh. All rights reserved.
//

import UIKit

let cellIdentifier:String = "CELL"

class SLTableViewController: SLViewController,UITableViewDataSource,UITableViewDelegate {
    
    var showTable = SLTableView()
    var dataSource:NSMutableArray = NSMutableArray()
    
    //MARK: view lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = SLColor.sl_bg_color()
        loadTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.showTable.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))
        self.showTable.autoresizingMask = UIViewAutoresizing.FlexibleHeight
    }
    
    func loadTableView(){
        self.showTable = SLTableView.init(frame: self.view.bounds, style: .Plain)
        self.showTable.dataSource = self
        self.showTable.delegate = self
        self.showTable.backgroundColor = UIColor.clearColor()
        self.showTable.separatorStyle = .None
        self.showTable.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        self.showTable.registerClass(SLTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(self.showTable)
    }
    
    //MARK: tableView DataSource/delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? SLTableViewCell
        if(cell == nil){
            cell = SLTableViewCell.init(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell!.textLabel?.text = "#蝌蚪音客"
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    //MARK: override father function
    
    override func keyboardWillShow(notification: NSNotification) {
        super.keyboardWillShow(notification)
        let info:NSDictionary = notification.userInfo!
        let kbSize:CGSize = (info.objectForKey(UIKeyboardFrameEndUserInfoKey)?.CGRectValue.size)!
        let contentInsets:UIEdgeInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
        self.showTable.contentInset = contentInsets
        self.showTable.scrollIndicatorInsets = contentInsets
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        super.keyboardWillHide(notification)
        UIView.animateWithDuration(0.3) { () -> Void in
            self.showTable.contentInset = UIEdgeInsetsZero
            self.showTable.scrollIndicatorInsets = UIEdgeInsetsZero
        }
    }
}
