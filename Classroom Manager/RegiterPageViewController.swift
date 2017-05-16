//
//  RegiterPageViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/15/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//
//
import Foundation
import UIKit

class RegisterPageViewController: UIViewController
{
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
        }
    
    override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
        }
    
    @IBAction func registerButtonTapped(sender: AnyObject)
        {
            let userEmail = userEmailTextField.text
            let userPassword = userPasswordTextField.text
            let userRepeatPassword = repeatPasswordTextField.text
        
            // Check for empty fields
            if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
                {
                    // Display alert message
                    displayMyAlertMessage(userMessage: "All fields are required")
                    return
                }
        
            //Check if passwords match
            if(userPassword != userRepeatPassword)
                {
                    // Display an alert message
                    displayMyAlertMessage(userMessage: "Passwords do not match")
                    return
            
                }
            // Store data
            UserDefaults.standard.set(userEmail, forKey: "userEmail")
            UserDefaults.standard.set(userPassword, forKey: "userPassword")
            UserDefaults.standard.synchronize()
            
            self.dismiss(animated: true, completion:nil)
        }
    
    func displayMyAlertMessage(userMessage:String)
        {
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
            myAlert.addAction(okAction);
        
            self.present(myAlert, animated:true, completion:nil);
        }
    
    func iHaveAnAccountButtonTapped(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
