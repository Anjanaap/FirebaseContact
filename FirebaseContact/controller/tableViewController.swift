//
//  tableViewController.swift
//  FirebaseContact
//
//  Created by Chitra Hari on 17/08/19.
//  Copyright © 2019 Chitra Hari. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var contactArray : [contactBook] = [contactBook]()
    @IBOutlet weak var contactList: UITableView!
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return contactArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactView", for: indexPath) as! TableViewCell
        cell.lblName.text = contactArray[indexPath.row].name
        cell.lblNumber.text = contactArray[indexPath.row].number
        return cell
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactList.delegate = self
        contactList.dataSource = self
//        txtMsgText.delegate = self
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
//        
//        messageTableView.addGestureRecognizer(tapGesture)
        
//        contactList.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier:"contactView")
       contactList.separatorStyle = .none
        retriveMessages()
    }
    func retriveMessages() {
      
        
        let contactDB = Database.database().reference().child("contacts")
        contactDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
           
            let user = snapshotValue["name"]!
            let mobile = snapshotValue["number"]!
            print(mobile)
            
            let contact = contactBook()
            contact.name = user
            contact.number = mobile
            self.contactArray.append(contact)
            self.contactList.reloadData()
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
