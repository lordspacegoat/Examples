//
//  ProcessViewController.swift
//  QA Simple Rewards
//
//  Created by Andrew Mitchell on 13/01/2017.
//  Copyright © 2017 Andrew Mitchell. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner
import ChameleonFramework

extension String {
    func splitByLength(_ length: Int) -> [String] {
        var result = [String]()
        var collectedCharacters = [Character]()
        collectedCharacters.reserveCapacity(length)
        var count = 0
        
        for character in self.characters {
            collectedCharacters.append(character)
            count += 1
            if (count == length) {
                // Reached the desired length
                count = 0
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
            }
        }
        
        // Append the remainder
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }
        
        return result
    }
}

class ProcessViewController: UIViewController {
    
    
    @IBOutlet weak var Label: UILabel!
    var thecode: String!
    
    @IBOutlet weak var allocated: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Take the data from the code and split it into Code & Pin so we can use it
        // The Code
        let thelabel    = "\(thecode)"
        let numbers = String(thelabel.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
        let code = numbers.splitByLength(16)
        
        // The Pin
        let mypin    = "\(code[1])"
        let pins = String(mypin.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
        let pin = pins.splitByLength(4)
        
        
        
        
        
        // Let's make the page look pretty....
        // Set the Background Gradient Colours.
        let colors:[UIColor] = [
            UIColor.flatBlack,
            UIColor.flatBlackDark
        ]
        
        // Set the Background Gradient.
        view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)
        
        // Now we need to hide the ugly Navigation Controller
        // Hide the Navigation Controller.
        self.navigationController?.isNavigationBarHidden = true
        // Set the Navigation Bar Colour to White
        self.navigationController?.navigationBar.barTintColor = UIColor.flatWhite
        
        //Call the function to escape the keyboard
        self.hideKeyboardWhenTappedAround()
        
        
        
        // Login data for the API request
        let headers: HTTPHeaders = [
            "api-username-v2": "53",
            "api-key-v2": "d162df24802f4fc6934dcd64ab7bbabd",
            "Content-Type": "application/json"
        ]
        
        // Time to grab the users name and password for the API request
        let parameters: Parameters = [
            "uid":"54891",
            "token":"\(code[0])",
            "pwd":"\(pin[0])"
            
        ]
        
        // Set the API End Point
        let url = "http://www.incentivebank.com.i.isstage.com/api/v2/rewardcode/redeem/"
        
        
        // Begin the API request
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            
            SwiftSpinner.show("Processing Transaction")
            
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                
                
                // Everything is A OK
                if json["status"] == "OK" {
                    SwiftSpinner.hide()
                    // create the alert
                    let alert = UIAlertController(title: "Transaction Successful", message: "Congratulations, you have redeemed \(json["allocated"]) points to your account. Your new total is \(json["user"]["allocated"]) points, enjoy!", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    
                    
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                
                // Error Codes
                
                
                // Reward Code / Password entered incorrectly
                if json["status"] == "TOKEN_OR_PASSWORD_INVALID" {
                    SwiftSpinner.hide()
                    // create the alert
                    let alert = UIAlertController(title: "Transaction Failed", message: "Either the Reward Code or the Pin is incorrect.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
                // No points were assigned to this reward code in admin.
                if json["status"] == "TOKEN_VALUE_NOT_ASSIGNED" {
                    SwiftSpinner.hide()
                    let alert = UIAlertController(title: "Transaction Failed", message: "There are currently no points assigned to that reward code.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                // Inactive reward code in admin.
                if json["status"] == "TOKEN_INACTIVE" {
                    SwiftSpinner.hide()
                    let alert = UIAlertController(title: "Transaction Failed", message: "That reward code is no longer active.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                // An expiry was set for the reward code and the reward code has now expired.
                if json["status"] == "TOKEN_EXPIRED" {
                    SwiftSpinner.hide()
                    let alert = UIAlertController(title: "Transaction Failed", message: "That reward code has expired.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                // An expiry was set for the reward code and the reward code has now expired.
                if json["status"] == "TOKEN_USED" {
                    SwiftSpinner.hide()
                    let alert = UIAlertController(title: "Transaction Failed", message: "That reward code has already been used.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:
                        { action in self.dismiss(animated: true, completion: nil) }
                    ))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                
                
            // Something went really wrong
            case .failure(let error):
                SwiftSpinner.hide()
                
            }
        }
        
        
    }
    
    
}
