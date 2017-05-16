//
//  per2TableViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/19/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class per2TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblTableView: UITableView!
    
    var nameArray = [String]()
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            getNameArray()
        }
    
    override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return nameArray.count
        }
    
    func getNameArray()
        {
            marrStudentsData = NSMutableArray()
        
            marrStudentsData = ModelManager.getInstance().getAllStudentData()
        
            var studentName = String()
            var index:Int = 0
        
            sharedInstance.database!.open()
        
            let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '2';", withArgumentsIn: nil)
        
            if (resultSet != nil)
                {
                    while resultSet.next()
                        {
                            studentName = (resultSet?.string(forColumn: "name"))!
                
                            nameArray.insert(studentName, at: index)
                
                            index += 1
                        }
                }
            sharedInstance.database!.close()
        
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! attendanceTableViewCell
        
            cell.nameLabel.text = nameArray[indexPath.row]
        
            return cell
        }
}
