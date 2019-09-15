//
//  RegisterViewController.swift
//  FirebaseContact
//
//  Created by Chitra Hari on 17/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import SVProgressHUD
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtRegPass: UITextField!
    @IBOutlet weak var txtRegEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: txtRegEmail.text!, password: txtRegPass.text!) { (user, error) in
            if error != nil
            {print(error!)
                
            }else {
                print("data registered!")
                let regAlert = UIAlertController(title: "registered successfully", message: "you have registered your data ", preferredStyle: .alert)
                let contactview = UIAlertAction(title: "go to contact view", style: .default, handler: { ACTION in
                    self.performSegue(withIdentifier: "regTableView", sender: self)
                })
                regAlert.addAction(contactview)
                SVProgressHUD.dismiss()
                self.present(regAlert, animated: true, completion: nil)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
