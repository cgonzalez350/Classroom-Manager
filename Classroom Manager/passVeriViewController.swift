//
//  passVeriViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/20/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class passVeriViewController: UIViewController
{
    @IBOutlet weak var userPasswordTextField1: UITextField!

    @IBOutlet weak var userPasswordTextField2: UITextField!
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
    super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any)
    {
            let userPassword1 = userPasswordTextField1.text
    
            let userPassword2 = userPasswordTextField2.text

            if((userPassword1?.isEmpty)! || (userPassword2?.isEmpty)!)
                {
                    // Display alert message
                    displayMyAlertMessage(userMessage: "All fields are required")
                    return
                }
            sharedInstance.database!.open()
    
            if (userPassword1! != userPassword2!)
                {
                    displayMyAlertMessage(userMessage: "passwords do not match \n Please try again")
                    return
                }
            else
                {
                    displayMyAlertMessage(userMessage: "New Password has been set")
                }
    
    
            UserDefaults.standard.set(userEmail, forKey: "userEmail")
            UserDefaults.standard.synchronize()
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
    let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
    
    let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
    
    myAlert.addAction(okAction);
    
    self.present(myAlert, animated:true, completion:nil);
    }
    
    func iHaveAnAccountButtonTapped(sender: AnyObject)
    {
    self.dismiss(animated: true, completion: nil)
    }
}
