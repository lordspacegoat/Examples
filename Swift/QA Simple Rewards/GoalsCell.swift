//
//  GoalsCell.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 20/02/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit
import Kingfisher


class GoalsCell: UITableViewCell {

    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalText: UILabel!
    @IBOutlet weak var goalCost: UILabel!
    @IBOutlet weak var theimage: UIImageView!
    var theurl = ""
    @IBAction func PushMore(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: theurl)!)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Here you can customize the appearance of your cell
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customize imageView like you need
        self.imageView?.frame = CGRect(x: 20, y: 25, width: 75, height: 75)
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.goalCost.layer.cornerRadius = 0.5 * self.goalCost.bounds.size.width
    }
}
