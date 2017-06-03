//
//  RegisterViewController.swift
//  Movie
//
//  Created by Pham Huu Nhu on 6/3/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CreateAccount(_ sender: Any) {
        ref = Database.database().reference()
        
        if txtName.text!.isEmpty || txtUsername.text!.isEmpty
            || txtPassword.text!.isEmpty || txtEmail.text!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else{
            ref?.child("name").childByAutoId().setValue(txtName.text)
            ref?.child("username").childByAutoId().setValue(txtUsername.text)
            ref?.child("password").childByAutoId().setValue(txtPassword.text)
            ref?.child("email").childByAutoId().setValue(txtEmail.text)
            txtName.text = ""
            txtUsername.text = ""
            txtPassword.text = ""
            txtEmail.text = ""
            print("Them user thanh cong")
        }
        
        
    }
    

}
