//
//  ResetPasswordViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/20/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController
{
    @IBOutlet weak var userEmailTextField: UITextField!

    @IBOutlet weak var userLastNameTextField: UITextField!
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            getTeacherData()
        }
    
    override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
        }
            
            
    func getTeacherData()
        {
            marrTeachersData = NSMutableArray()
                
            marrTeachersData = ModelManager.getInstance().getAllTeacherData()
        }
    
    @IBAction func passwordResetButtonTapped(_ sender: Any)
    {
    
        userEmail = userEmailTextField.text!
        let userLastname = userLastNameTextField.text

        print(userEmail)
        // Check for empty fields
        if((userEmail.isEmpty) || (userLastname?.isEmpty)!)
        {
            // Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            return
        }
        // Store data
        sharedInstance.database!.open()
        
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
