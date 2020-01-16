//
//  InformationItemTableViewCell.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/15/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import UIKit

class InformationItemTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblOpen: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    @IBOutlet weak var lblClose: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
