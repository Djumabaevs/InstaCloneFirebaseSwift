//
//  ViewController.swift
//  InstaCloneFirebaseSwift
//
//  Created by Bakyt Dzhumabaev on 5/8/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
            
                if error != nil {
                    
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            
            let alert = UIAlertController(title: "Error.", message: "Email/Password?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK.", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
}

