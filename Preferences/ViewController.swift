//
//  ViewController.swift
//  Preferences
//
//  Created by USER on 10/19/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//
//import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let section = ["Sort Individual Contacts by", "When importing Contacts include Contacts from:"]
    let items = [["First Name", "Last Name",""],["iCloud","Facebook","Linkedin","Exchange"]]

    @IBOutlet weak var tableView: UITableView!
    let image = UIImage(named: "Unchecked-Checkbox-50.png")
    let imageSelected = UIImage(named: "Checked-Checkbox -Filled-50")
    
    @IBOutlet weak var donBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
      
        donBtn.layer.cornerRadius = 15
        donBtn.layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
        donBtn.layer.borderColor = UIColor.blackColor().CGColor
        donBtn.layer.backgroundColor = UIColor(red: 22/255, green: 77/255, blue: 109/255, alpha: 1.0).CGColor
        }
    
   
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 2 {
            return 150
        } else {
            return 50
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let title = UILabel()
        title.font = UIFont.boldSystemFontOfSize(12.0)
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        header.textLabel?.font=title.font
        header.textLabel?.textColor=title.textColor
       

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 2{
          let cell = tableView.dequeueReusableCellWithIdentifier("CellForLbl", forIndexPath: indexPath) as! CellForLbl
            cell.lbl.text = "Notes: "
            cell.lbl2.text = "Company Contacts are always listed alphabetically"
            cell.lbl3.text = "Contacts under a Company are always arranged Manually"
          return cell
        }else{
        
        let cellIdentifier = "CellForBtn"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CellForBtn
        cell.cellBtn.setBackgroundImage(image, forState: UIControlState.Normal)
        cell.cellLbl.text = self.items[indexPath.section][indexPath.row]
            
        var myIndex = 0
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    myIndex = 0
                }
                if indexPath.row == 1 {
                    myIndex = 1
                }
            } else {
                if indexPath.row == 0 {
                    myIndex = 2
                }
                if indexPath.row == 1 {
                    myIndex = 3
                }
                if indexPath.row == 2 {
                    myIndex = 4
                }
                if indexPath.row == 3 {
                    myIndex = 5
                }
            }
        cell.cellBtn.tag = myIndex
        cell.cellBtn?.addTarget(self, action: #selector(ViewController.cellBtnQ(_:)), forControlEvents: .TouchUpInside)
        return cell
        }
    }
    
    //MARK: SETTINGS BUTTONS STATUS
    var isSelected = false
    var FNameChecked = false
    var LNameChecked = false
    var iCloudChecked = false
    var fBCheck = false
    var linkedinChecked = false
    var ExchangeChecked = false
    
    func cellBtnQ(sender: UIButton) -> Int {

        if isSelected == true {
            sender.setBackgroundImage(image, forState: UIControlState.Normal)
            if sender.tag == 0 {
                FNameChecked = false
                LNameChecked = true
            }
            if sender.tag == 1 {
                LNameChecked = false
                FNameChecked = true
            }
            if sender.tag == 2 {
                iCloudChecked = false
            }
            if sender.tag == 3 {
                fBCheck = false
            }
            if sender.tag == 4 {
                linkedinChecked = false
            }
            if sender.tag == 5 {
                ExchangeChecked = false
            }
            
            isSelected = false
        }else {
            sender.setBackgroundImage(imageSelected, forState: UIControlState.Normal)
            if sender.tag == 0 {
                FNameChecked = true
            }
            if sender.tag == 1 {
                LNameChecked = true
            }
            if sender.tag == 2 {
                iCloudChecked = true
            }
            if sender.tag == 3 {
                fBCheck = true
            }
            if sender.tag == 4 {
                linkedinChecked = true
            }
            if sender.tag == 5 {
                ExchangeChecked = true
            }
            
            isSelected = true
        }
        return 1
    }
}

