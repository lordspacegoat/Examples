//
//  GoalsViewController.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 09/02/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class GoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tblJSONG: UITableView!
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var datas: [JSON] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblJSONG.dataSource = self
        tblJSONG.delegate = self
        
        // Set the API End Point
        let url = "https://www.qaflooringsolutions.com/Goals.json"
        
        
        // Begin the API request
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                    self.datas = json["goal"].arrayValue
                    print (self.datas.count)
                    self.tblJSONG.reloadData()
                
            // Something went really wrong
            case .failure(let error): break
            }
       
}
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GoalsCell = tableView.dequeueReusableCell(withIdentifier: "CellGoals") as! GoalsCell
        let tabledatas = datas[indexPath.row]
        if let goaldesc = tabledatas["text"].string{
            cell.goalText?.text = goaldesc
        }
        if let goaltitle = tabledatas["title"].string{
            cell.goalTitle?.text = goaltitle
        }
        if let goalurl = tabledatas["url"].string{
            let url = URL(string: goalurl)
            cell.theurl = "\(url)"
            let imagehold = UIImage(named: "tim-sand-timer")
            cell.imageView?.kf.setImage(with: url, placeholder: imagehold, options: [.transition(.fade(0.4)), .forceRefresh])
            cell.theimage.setNeedsLayout() //invalidate current layout
            cell.theimage.layoutIfNeeded() //update immediately
        }
        if let goalpts = tabledatas["image"].string{
            cell.goalCost?.text = goalpts
        }
        if let end = tabledatas["end"].string{
            cell.theurl = end
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = backgroundView
        return cell
}
}
