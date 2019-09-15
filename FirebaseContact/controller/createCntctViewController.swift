//
//  createCntctViewController.swift
//  FirebaseContact
//
//  Created by Chitra Hari on 17/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import Firebase

class createCntctViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
   
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: UIBarButtonItem) {

//        let contactDB = Database.database().reference().child("contacts")
//        let contactDictionary = ["name" : Auth.auth().currentUser?.email , "number":txtNumber.text!]
//
//        contactDB.childByAutoId().setValue(contactDictionary) {
//            (error,reference) in if error != nil {
//                print(error!)
//            }else {
//                print("data saved")
//
//            }
//        }
//
 //**********************************************************************
        
        let contactDB = Database.database().reference().child("contacts")
        let contactDictionary = ["name": txtName.text!, "number": txtNumber.text!]
        contactDB.childByAutoId().setValue(contactDictionary){ (error,reference) in if error != nil {
            print(error!)
            
        }else {
            print("Message saved successfully!")
            
         
            }
        }
       performSegue(withIdentifier: "viewTable", sender: self)
        
        
        
    }
    

}
