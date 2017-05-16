//
//  PeriodTwoViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/15/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class PeriodTwoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var TableOneCollectionView: UICollectionView!
    @IBOutlet weak var TableTwoCollectionView: UICollectionView!
    @IBOutlet weak var TableThreeCollectionView: UICollectionView!
    @IBOutlet weak var TableFourCollectionView: UICollectionView!
    @IBOutlet weak var TableFiveCollectionView: UICollectionView!
    @IBOutlet weak var TableSixCollectionView: UICollectionView!
    @IBOutlet weak var TableSevenCollectionView: UICollectionView!
    @IBOutlet weak var TableEightCollectionView: UICollectionView!
    
    var per2name1Array = [" ", " ", " ", " "," ", " "]
    var per2name2Array = [" ", " ", " ", " "," ", " "]
    var per2name3Array = [" ", " ", " ", " "," ", " "]
    var per2name4Array = [" ", " ", " ", " "," ", " "]
    var per2name5Array = [" ", " ", " ", " "," ", " "]
    var per2name6Array = [" ", " ", " ", " "," ", " "]
    var per2name7Array = [" ", " ", " ", " "," ", " "]
    var per2name8Array = [" "]
    
    @IBOutlet weak var addRemoveStedentName: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
        {
            self.getStudentsArray()
        }
    
    @IBAction func randomStudentPick(_ sender: Any)
    {
        var nameArray = [String]()
        
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

        func randomSequenceGenerator(min:Int, max:Int) -> () -> Int
        {
            var numbers: [Int] = []
            
            return
                {
                    if numbers.count == 0
                    {
                        numbers = Array(min ... max)
                    }
                    
                    let index = Int(arc4random_uniform(UInt32(numbers.count)))
                    
                    return numbers.remove(at: index)
            }
        }
        
        var randomNums: [Int] = []
        
        let getRandom = randomSequenceGenerator(min: 0, max: (nameArray.count - 1))
        
        for i in 0...(nameArray.count - 1)
        {
            randomNums.insert(getRandom(), at: i)
        }
        
        displayMyAlertMessage(userMessage: nameArray[randomNums[0]])
    }

    
    func getStudentsArray()
    {
        marrStudentsData = NSMutableArray()
        
        marrStudentsData = ModelManager.getInstance().getAllStudentData()
        
        let _:NSString
        var index:Int = 0

        var studentName = String()
        
        sharedInstance.database!.open()
        
        let resultSet2: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '2';", withArgumentsIn: nil)
        
        if (resultSet2 != nil)
        {
            while resultSet2.next()
            {
                studentName = (resultSet2?.string(forColumn: "name"))!
                
                if index < 6
                {
                    per2name1Array.insert(studentName, at: index)
                }
                else if index > 5 && index < 12
                {
                    per2name2Array.insert(studentName, at: index - 6)
                }
                else if index > 11 && index < 18
                {
                    per2name3Array.insert(studentName, at: index - 12)
                }
                else if index > 17 && index < 24
                {
                    per2name4Array.insert(studentName, at: index - 18)
                }
                else if index > 23 && index < 30
                {
                    per2name5Array.insert(studentName, at: index - 24)
                }
                else if index > 29 && index < 36
                {
                    per2name6Array.insert(studentName, at: index - 30)
                }
                else if index > 35 && index < 42
                {
                    per2name7Array.insert(studentName, at: index - 36)
                }
                else
                {
                    per2name8Array.insert(studentName, at: index - 42)
                }
                index += 1
                
            }
        }
        elCount = index
        
        sharedInstance.database!.close()
    }
    
    override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return 6
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        collectionView.allowsMultipleSelection = true
        
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = per2name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per2name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per2name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per2name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per2name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per2name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per2name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per2name8Array[indexPath.row]
            
            return cell
        }
        
    }
    
    @IBAction func RandomSeating(_ sender: Any)
    {
        per2name1Array = [" ", " ", " ", " "," ", " "]
        per2name2Array = [" ", " ", " ", " "," ", " "]
        per2name3Array = [" ", " ", " ", " "," ", " "]
        per2name4Array = [" ", " ", " ", " "," ", " "]
        per2name5Array = [" ", " ", " ", " "," ", " "]
        per2name6Array = [" ", " ", " ", " "," ", " "]
        per2name7Array = [" ", " ", " ", " "," ", " "]
        per2name8Array = [" "]
        
        
        let _:NSString
        var index:Int = 0
        
        var tempArray = [String]()
        
        var random = Int()
        
        sharedInstance.database!.open()
        
        let resultSet2: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '2';", withArgumentsIn: nil)
        
        if (resultSet2 != nil)
        {
            while resultSet2.next()
            {
                tempArray.append((resultSet2?.string(forColumn: "name"))!)
            }
        }
        
        var previousNumber: UInt32?
        
        func randomSequenceGenerator(min:Int, max:Int) -> () -> Int
        {
            var numbers: [Int] = []
            
            return
                {
                    if numbers.count == 0
                    {
                        numbers = Array(min ... max)
                    }
                    
                    let index = Int(arc4random_uniform(UInt32(numbers.count)))
                    
                    return numbers.remove(at: index)
            }
        }
        
        var randomNums: [Int] = []
        
        let getRandom = randomSequenceGenerator(min: 0, max: (tempArray.count - 1))
        
        for i in 0...(tempArray.count - 1)
        {
            randomNums.insert(getRandom(), at: i)
        }
        
        for i in 0...(tempArray.count - 1)
        {
            if index < 6
            {
                per2name1Array.insert(tempArray[randomNums[i]], at: index)
            }
            else if index > 5 && index < 12
            {
                per2name2Array.insert(tempArray[randomNums[i]], at: index - 6)
            }
            else if index > 11 && index < 18
            {
                per2name3Array.insert(tempArray[randomNums[i]], at: index - 12)
            }
            else if index > 17 && index < 24
            {
                per2name4Array.insert(tempArray[randomNums[i]], at: index - 18)
            }
            else if index > 23 && index < 30
            {
                per2name5Array.insert(tempArray[randomNums[i]], at: index - 24)
            }
            else if index > 29 && index < 36
            {
                per2name6Array.insert(tempArray[randomNums[i]], at: index - 30)
            }
            else if index > 35 && index < 42
            {
                per2name7Array.insert(tempArray[randomNums[i]], at: index - 36)
            }
            else
            {
                per2name8Array.insert(tempArray[randomNums[i]], at: index - 42)
            }
            index += 1
            
        }
        
        elCount = index
        
        sharedInstance.database!.close()
        
        super.loadView()
    }
    
    func MycollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = per2name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per2name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per2name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per2name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per2name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per2name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per2name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per2name8Array[indexPath.row]
            
            return cell
        }
        
    }
    
    @IBAction func removeStudent(_ sender: Any)
    {
        let _:NSString
        var index:Int = 0
        
        let logInInfo : students = students()
        
        var studentName = String()
        
        sharedInstance.database!.open()
        
        logInInfo.name = addRemoveStedentName.text!
        
        logInInfo.per = "2"
        
        if sharedInstance.deleteStudentData(logInInfo) == true
        {
            print("\n\n\n\nThe student ")
            print(addRemoveStedentName)
            print("was added\n\n\n")
        }
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '2';", withArgumentsIn: nil)
        
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                studentName = (resultSet?.string(forColumn: "name"))!
                
                if index < 6 && studentName != addRemoveStedentName.text
                {
                    per2name1Array.insert(studentName, at: index)
                    index += 1
                }
                else if index > 5 && index < 12 && studentName != addRemoveStedentName.text
                {
                    per2name2Array.insert(studentName, at: index - 6)
                    index += 1
                }
                else if index > 11 && index < 18 && studentName != addRemoveStedentName.text
                {
                    per2name3Array.insert(studentName, at: index - 12)
                    index += 1
                }
                else if index > 17 && index < 24 && studentName != addRemoveStedentName.text
                {
                    per2name4Array.insert(studentName, at: index - 18)
                    index += 1
                }
                else if index > 23 && index < 30 && studentName != addRemoveStedentName.text
                {
                    per2name5Array.insert(studentName, at: index - 24)
                    index += 1
                }
                else if index > 29 && index < 36 && studentName != addRemoveStedentName.text
                {
                    per2name6Array.insert(studentName, at: index - 30)
                    index += 1
                }
                else if index > 35 && index < 42 && studentName != addRemoveStedentName.text
                {
                    per2name7Array.insert(studentName, at: index - 36)
                    index += 1
                }
                else if studentName != addRemoveStedentName.text
                {
                    per2name8Array.insert(studentName, at: index - 42)
                    index += 1
                }
            }
        }
        elCount = index
        
        sharedInstance.database!.close()
        
        UserDefaults.standard.synchronize()
        
        super.loadView()
    }
    
    func NewcollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = per2name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per2name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per2name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per2name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per2name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per2name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per2name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per2name8Array[indexPath.row]
            
            return cell
        }
        
    }
    
    @IBAction func addStudent(_ sender: Any)
    {
        let _:NSString
        var index:Int = 0
        
        let logInInfo : students = students()
        
        var studentName = String()
        
        sharedInstance.database!.open()
        
        logInInfo.name = addRemoveStedentName.text!
        
        logInInfo.per = "1"
        
        if sharedInstance.addStudentData(logInInfo) == true
        {
            print("\n\n\n\nThe student ")
            print(addRemoveStedentName)
            print("was added\n\n\n")
        }
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '1';", withArgumentsIn: nil)
        
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                studentName = (resultSet?.string(forColumn: "name"))!
                
                if index < 6
                {
                    per2name1Array.insert(studentName, at: index)
                }
                else if index > 5 && index < 12
                {
                    per2name2Array.insert(studentName, at: index - 6)
                }
                else if index > 11 && index < 18
                {
                    per2name3Array.insert(studentName, at: index - 12)
                }
                else if index > 17 && index < 24
                {
                    per2name4Array.insert(studentName, at: index - 18)
                }
                else if index > 23 && index < 30
                {
                    per2name5Array.insert(studentName, at: index - 24)
                }
                else if index > 29 && index < 36
                {
                    per2name6Array.insert(studentName, at: index - 30)
                }
                else if index > 35 && index < 42
                {
                    per2name7Array.insert(studentName, at: index - 36)
                }
                else
                {
                    per2name8Array.insert(studentName, at: index - 42)
                }
                index += 1
                
            }
        }
        
        if index < 6
        {
            per2name1Array.insert(addRemoveStedentName.text!, at: index)
        }
        else if index > 5 && index < 12
        {
            per2name2Array.insert(addRemoveStedentName.text!, at: index - 6)
        }
        else if index > 11 && index < 18
        {
            per2name3Array.insert(addRemoveStedentName.text!, at: index - 12)
        }
        else if index > 17 && index < 24
        {
            per2name4Array.insert(addRemoveStedentName.text!, at: index - 18)
        }
        else if index > 23 && index < 30
        {
            per2name5Array.insert(addRemoveStedentName.text!, at: index - 24)
        }
        else if index > 29 && index < 36
        {
            per2name6Array.insert(addRemoveStedentName.text!, at: index - 30)
        }
        else if index > 35 && index < 42
        {
            per2name7Array.insert(addRemoveStedentName.text!, at: index - 36)
        }
        else
        {
            per2name8Array.insert(addRemoveStedentName.text!, at: index - 42)
        }
        index += 1
        
        elCount = index
        
        sharedInstance.database!.close()
        
        UserDefaults.standard.synchronize()
        
        super.loadView()
    }
    
    func New2collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = per2name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per2name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per2name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per2name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per2name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per2name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per2name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per2name8Array[indexPath.row]
            
            return cell
        }
        
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Picked Student", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
    }
    
}
