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
//        performSegue(withIdentifier: "toFeedVC", sender: nil)
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {
                (authdata, error) in
            
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)

                }
            }
        } else {
            makeAlert(title: "Error!", message: "email/password?")

        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
            
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error!")
                    
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(title: "Error!", message: "email/password?")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK.", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

