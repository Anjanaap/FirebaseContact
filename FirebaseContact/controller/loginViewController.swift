//
//  ViewController.swift
//  FirebaseContact
//
//  Created by Chitra Hari on 17/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if error != nil{
            print(error!)
            }else {
                print("loggedin successfully!")
                let loginAlert = UIAlertController(title: "login successfully", message: "you can add contact details!", preferredStyle: .alert)
                let tableView = UIAlertAction(title: "go to contacts", style: .default
                    , handler: { ACTION in self.performSegue(withIdentifier: "tableView", sender: self)
                })
                loginAlert.addAction(tableView)
                self.present(loginAlert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    


}

