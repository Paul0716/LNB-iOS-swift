//
//  FilterSelecedContoller.swift
//  lnb_app
//
//  Created by Paul Ku on 2016/8/17.
//  Copyright © 2016年 Paul Ku. All rights reserved.
//

import UIKit
//import ActionSheetPicker_3_0

class FilterSelecedContoller: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ActionSheetMultipleStringPicker.showPickerWithTitle("Multiple String Picker", rows: [
//            ["One", "Two", "A lot"],
//            ["Many", "Many more", "Infinite"]
//            ], initialSelection: [2, 2], doneBlock: {
//                picker, values, indexes in
//                
//                print("values = \(values)")
//                print("indexes = \(indexes)")
//                print("picker = \(picker)")
//                return
//            }, cancelBlock: { ActionMultipleStringCancelBlock in return }, origin: sender)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: - PickerView Function
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
}
