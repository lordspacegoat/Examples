//
//  YourProfile.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 03/01/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import ChameleonFramework
import Firebase

class YourProfile: UIViewController {
    
    
    @IBAction func callQA(_ sender: Any) {
        if let url = URL(string: "tel://01514953434") {
            UIApplication.shared.open(url)
        }
    }
    @IBOutlet weak var thetitletexy: UILabel!
    @IBOutlet weak var thebodytext: UITextView!
    @IBOutlet weak var targetpoints: UILabel!
    @IBOutlet weak var cardname: UILabel!
    @IBOutlet weak var cardno: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var validfrom: UILabel!
    
    var uid: String!
    var theano: String!
       override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tell the user that we are loading
        SwiftSpinner.show("Connecting to QA Satellite...")
        // Let's make the page look pretty....
        // Set the Background Gradient Colours.
        let colors:[UIColor] = [
            UIColor.flatBlack,
            UIColor.flatBlackDark
        ]
        
        // Set the Background Gradient.
        view.backgroundColor = GradientColor(.radial, frame: view.frame, colors: colors)
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
               // Lets get the news
        Alamofire.request("http://qaflooringsolutions.com/news.json").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let thetitle = json["news"]["articles"][0]["title"]
                let thepost = json["news"]["articles"][0]["post"]
                self.thetitletexy.text = thetitle.string
                self.thebodytext.text = thepost.string
            // Something went really wrong
            case .failure(let error):
                SwiftSpinner.hide()
            }
            
            // Login data for the API request
            let headers: HTTPHeaders = [
                "api-username-v2": "53",
                "api-key-v2": "d162df24802f4fc6934dcd64ab7bbabd",
                "Content-Type": "application/json"
            ]
            
            let mycode = self.uid!
            // Set the API End Point
            let url = "http://www.incentivebank.com.i.isstage.com/api/v2/user/an/?q=\(mycode)"
            
            
            // Begin the API request
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    // Everything is A OK
                    if json["status"] == "OK" {
                        let name = json["name"]
                        let myname2 = "\(name)"
                        let ano = json["an"]
                        let meano = "\(ano)"
                        self.theano = meano
                        let points1 = json["allocated"]
                        let points2 = "\(points1)"
                        let myname = "Hi, \(name)"
                        let myan = "Account No: \(ano)"
                        self.points.text = points2
                        self.cardno.text = myan
                        self.cardname.text = myname
                        SwiftSpinner.hide()
                        
                        
                        // Log the event
                        FIRAnalytics.logEvent(withName: "User_Logged_In", parameters: [
                            "Name": myname2 as NSObject,
                            "Account_No": self.theano as NSObject
                            ])

                        
                        // Stop spinning; we have loaded.
                        SwiftSpinner.hide()
                        
                    }
                    
                    
                // Something went really wrong
                case .failure(let error):
                    SwiftSpinner.hide()
                }
                
               
            }
            
        }
        
       

    }

    
    
    // We are performing a Segue.. Time to load our transport
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TransactionsViewController {
                destination.thecode = theano
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  }
