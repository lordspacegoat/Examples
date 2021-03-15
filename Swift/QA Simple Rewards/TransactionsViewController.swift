//
//  TransactionsViewController.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 09/02/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class TransactionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var datas: [JSON] = []
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tblJSON: UITableView!
    var thecode: String!

      override func viewDidLoad() {
        super.viewDidLoad()
        let mysecretcode = "\(self.thecode ?? "")"
    
        tblJSON.dataSource = self
        tblJSON.delegate = self
        
       
        
    
        // Login data for the API request
        let headers: HTTPHeaders = [
            "api-username-v2": "53",
            "api-key-v2": "d162df24802f4fc6934dcd64ab7bbabd",
            "Content-Type": "application/json"
        ]
        
        // Set the API End Point
        let url = "http://www.incentivebank.com.i.isstage.com/api/v2/user/ansummary/?q=\(mysecretcode)"
        // Begin the API request
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // Everything is A OK
                if json["status"] == "OK" {
                    self.datas = json["recentTransactions"].arrayValue
                    self.tblJSON.reloadData()
                }
        
 // Something went really wrong
            case .failure(let error): break
            }
            


    }

  }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyCustomCell
        let tabledata = datas[indexPath.row]
        
        if let caption = tabledata["type"].string{
            cell.title?.text = caption
        }
        if let date = tabledata["creationDate"].string{
            cell.date?.text = date
        }
        if let points = tabledata["points"].int{
            cell.points?.text = "\(points)"
            if points < 0 {
                cell.points?.textColor = UIColor.flatRedDark
            } else if points == 0 {
                cell.points?.textColor = UIColor.flatGrayDark
            } else if points > 0 {
                cell.points?.textColor = UIColor.flatGreen
            }        }
        return cell
    }

    
}
