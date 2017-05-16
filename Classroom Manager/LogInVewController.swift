//
//  LogInVewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/29/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

 import Foundation
 import UIKit

 var marrTeachersData : NSMutableArray!
 var marrStudentsData : NSMutableArray!
 var userEmail = String()

 class LogInViewController: UIViewController
    {
        @IBOutlet weak var EmailTextField: UITextField!
        @IBOutlet weak var PasswordTextField: UITextField!
    
        override func viewDidLoad()
            {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
            }
 
        override func viewWillAppear(_ animated: Bool)
            {
                self.getTeacherData()
                self.getStudentData()
            }
 
        override func didReceiveMemoryWarning()
            {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
 
        func getTeacherData()
            {
                marrTeachersData = NSMutableArray()
 
                marrTeachersData = ModelManager.getInstance().getAllTeacherData()
            }
    
        func getStudentData()
            {
                marrStudentsData = NSMutableArray()
        
                marrStudentsData = ModelManager.getInstance().getAllStudentData()
            }


        @IBAction func LogInButtonTapped(sender: Any)
            {
                userEmail = EmailTextField.text!
                let userPassword = PasswordTextField.text!
                var count: Int
            
                count = 0

                // Check for empty fields
                if((userEmail.isEmpty) || (userPassword.isEmpty))
                    {
                        displayMyAlertMessage(userMessage: "All fields are required")
                    
                        return
                    }
                
                sharedInstance.database!.open()
                
                let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("select * from users", withArgumentsIn: nil)
                
                if (resultSet != nil)
                    {
                        while resultSet.next() && count == 0
                            {
                                if (userEmail == resultSet?.string(forColumn: "email"))
                                    {
                                        if (userPassword == resultSet?.string(forColumn: "passw"))
                                            {
                                                count = 1
                                       
                                                //displayMyAlertMessage(userMessage: "Login successful")
                                            }
                                        else
                                            {
                                                displayMyAlertMessage(userMessage: "Login Credentials are not valid Please try again")
                                                return
                                            }
                                    }
                                else
                                    {
                                        displayMyAlertMessage(userMessage: "Login Credentials are not valid Please try again")
                                        
                                        return
                                    }
                            }
                        
                    }
                
                UserDefaults.standard.set(userEmail, forKey: "userEmail")
                UserDefaults.standard.set(userPassword, forKey: "userPassword")
                UserDefaults.standard.synchronize()
                

            }
    
        func displayMyAlertMessage(userMessage:String)
            {
                let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
                let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
                myAlert.addAction(okAction)
        
                self.present(myAlert, animated:true, completion:nil)
            }
    
        func iHaveAnAccountButtonTapped(sender: AnyObject)
            {
                self.dismiss(animated: true, completion: nil)
            }
 }
 
