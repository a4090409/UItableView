//
//  ViewController.swift
//  UItableView
//
//  Created by ChinBuck on 2016/9/5.
//  Copyright © 2016年 ChinBuck. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var info:[[String]] = [["林書豪","陳信安"],["陳偉殷","林智勝","陳金鋒"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        //取得螢幕尺寸
        let fullScreen = UIScreen.mainScreen().bounds.size
        let myTableView = UITableView(frame: CGRect(x:0,y:20,width: fullScreen.width,height: fullScreen.height-20), style: .Grouped)
        
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.allowsMultipleSelection = false
        myTableView.allowsSelection = true;
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                cell.accessoryType = .Checkmark
            }
            else if indexPath.row == 1
            {
                cell.accessoryType = .DetailButton
            }
        }
        if let myLabel = cell.textLabel
        {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }
        return cell;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return info.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "籃球":"棒球"
        return title
    }

}

