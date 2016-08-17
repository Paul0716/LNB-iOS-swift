//
//  LNBListController.swift
//  lnb_app
//
//  Created by Paul Ku on 2016/8/15.
//  Copyright © 2016年 Paul Ku. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class LNBListController: UITableViewController {
    
    // MARK: -Properties
    var data: [[String:AnyObject]]! = []
    var index: Int = 1
    var amount: Int = 20
    var filteredCehck: Bool = false
    let periods = [
        "1年(12個月)":12,
        "1年半(18個月)":18,
        "2年(24個月)":24,
        "3年(36個月)":36,
        "4年(48個月)":48,
        "5年(60個月)":60,
        "6年(72個月)":72,
        "7年(84個月)":84
    ]
    let ranks = [
        "A+":"A0",
        "A":"A",
        "B":"B",
        "C":"C",
        "D":"D",
        "E":"E",
        "F":"F",
        "G1":"G1",
        "G2":"G2",
        "G3":"G3",
        "H1":"H1",
        "H2":"H2",
        "H3":"H3",
        "H4":"H4",
        "H5":"H5"
    ]
    
//    let Rank =

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewInit()

        Loans().getLists(index, amount: amount) { (data) in
            self.data = data
            self.tableView.reloadData()
        }
        self.refreshControl!.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(self.refreshControl!)
    }
    
    func viewInit() {
        // refreshing
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LNBCell", forIndexPath: indexPath) as! LNBListCell
        
        cell.totalPeriod?.text = "\(data[indexPath.row]["period"]!)期"
        cell.totalAmount?.text = "\(data[indexPath.row]["amount"]!)$"
        cell.creditRank?.text = "\(data[indexPath.row]["credit_level"]!)級"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Pull to load more data
    func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        // Simply adding an object to the data source for this example
        self.index += 1
        Loans().getLists(index, amount: amount) { (data) in
            var data = data as! Array
            data += self.data
            self.data = data as! [[String:AnyObject]]
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }
    
    // MARK: - show sorting modal
    @IBAction func filterPicker(sender: AnyObject) {
        ActionSheetMultipleStringPicker.showPickerWithTitle("排序條件", rows: [
            ["1年(12個月)", "1年半(18個月)","2年(24個月)","3年(36個月)","4年(48個月)","5年(60個月)","6年(72個月)","7年(84個月)"], ["A+","A","B","C","D","E","F","G1","G2","G3","H1","H2","H3","H4","H5"]
            ], initialSelection: [0,0], doneBlock: {
                picker, values, indexes in
                
                let filterPeriod = self.periods["\(indexes[0])"]!
                let filterRank = self.ranks["\(indexes[1])"]!
                Loans().getFilteredLists(1, amount: 20, periods: filterPeriod, rank: filterRank, completed: { (data) in
                    self.data = data
                    self.tableView.reloadData()
                })
                
                return
            }, cancelBlock: { ActionMultipleStringCancelBlock in
                print("cancel")
            return }, origin: sender)
    }
}
