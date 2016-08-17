//
//  LNBListCell.swift
//  lnb_app
//
//  Created by Paul Ku on 2016/8/15.
//  Copyright © 2016年 Paul Ku. All rights reserved.
//

import UIKit

class LNBListCell: UITableViewCell {
    // MARK: -Properties
    @IBOutlet weak var totalPeriod: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var creditRank: UILabel!
    
//    var loanInfo: [[String:AnyObject]]!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
