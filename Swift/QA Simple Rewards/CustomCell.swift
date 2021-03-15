//
//  CustomCell.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 19/02/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var points: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
