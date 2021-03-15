//
//  MyCustomCell.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 19/02/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
