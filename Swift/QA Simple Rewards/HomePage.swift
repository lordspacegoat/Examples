//
//  HomePage.swift
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


class HomePage: UIViewController {
    
    

    // Capture some user input
    // Our Username Login Field
    @IBOutlet weak var username: UITextField!
    
    // Our Password Login Field
    @IBOutlet weak var password: UITextField!
    
    // Return the error
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }

    // Someone pressed the Login button
    @IBAction func Login(_ sender: UIButton) {
        
        // Login data for the API request
        let headers: HTTPHeaders = [
            "api-username-v2": "53",
            "api-key-v2": "d162df24802f4fc6934dcd64ab7bbabd",
            "Content-Type": "application/json"
        ]
        
        // Time to grab the users name and password for the API request
        let parameters: Parameters = [
            "un": username.text as Any,
            "pwd": password.text as Any
            
        ]
        
        // Set the API End Point
        let url = "http://www.incentivebank.com.i.isstage.com/api/v2/user/validatecredentials/"
        
        // Tell the user that we are loading
        SwiftSpinner.show("Connecting to QA Satellite...")
        
        // Begin the API request
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // Uh ho, wrong password
                if json["status"] == "INVALID_PASSWORD" {
                    self.status.text = "You have entered the wrong password"
                    SwiftSpinner.hide()
                }
                
                // Everything is A OK
                if json["status"] == "OK" {
                    SwiftSpinner.hide()
                    self.status.text = "Logged In Successfully"
                    
                    // Grab the Users ID
                    let uid = json["user"]["an"]
                    let yourid = "\(uid)"
                    
                    // Take us to the profile page with the User ID
                    self.performSegue(withIdentifier: "LoginRedirect", sender: yourid)
                    
                    // Stop spinning; we have loaded.
                    SwiftSpinner.hide()
                    
                }
                
                // We can't find that username
                if json["status"] == "USERNAME_NOT_FOUND" {
                    SwiftSpinner.hide()
                    self.status.text = "Is that the correct username?"
                }
            
            // Something went really wrong
            case .failure(let error):
                SwiftSpinner.hide()
                self.status.text = "Something went wrong, please try again"
            }
        }

        
    }
    
   // We are performing a Segue.. Time to load our transport
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? YourProfile {
            if let yourid = sender as? String {
                destination.uid = yourid
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



// Let's give users the option to escape the keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
