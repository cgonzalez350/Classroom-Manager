//
//  PeriodFourViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/15/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class PeriodFourViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var TableOneCollectionView: UICollectionView!
    @IBOutlet weak var TableTwoCollectionView: UICollectionView!
    @IBOutlet weak var TableThreeCollectionView: UICollectionView!
    @IBOutlet weak var TableFourCollectionView: UICollectionView!
    @IBOutlet weak var TableFiveCollectionView: UICollectionView!
    @IBOutlet weak var TableSixCollectionView: UICollectionView!
    @IBOutlet weak var TableSevenCollectionView: UICollectionView!
    @IBOutlet weak var TableEightCollectionView: UICollectionView!
    
    var per4name1Array = [" ", " ", " ", " "," ", " "]
    var per4name2Array = [" ", " ", " ", " "," ", " "]
    var per4name3Array = [" ", " ", " ", " "," ", " "]
    var per4name4Array = [" ", " ", " ", " "," ", " "]
    var per4name5Array = [" ", " ", " ", " "," ", " "]
    var per4name6Array = [" ", " ", " ", " "," ", " "]
    var per4name7Array = [" ", " ", " ", " "," ", " "]
    var per4name8Array = [" "]
    
    @IBOutlet weak var addRemoveStudentName: UITextField!
    
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
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '4';", withArgumentsIn: nil)
        
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
        
        let resultSet4: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '4'", withArgumentsIn: nil)
        
        if (resultSet4 != nil)
        {
            while resultSet4.next()
            {
                studentName = (resultSet4?.string(forColumn: "name"))! //marrStudentsData.object(at: index) as! students
                
                if index < 6
                {
                    per4name1Array.insert(studentName, at: index)
                }
                else if index > 5 && index < 12
                {
                    per4name2Array.insert(studentName, at: index - 6)
                }
                else if index > 11 && index < 18
                {
                    per4name3Array.insert(studentName, at: index - 12)
                }
                else if index > 17 && index < 24
                {
                    per4name4Array.insert(studentName, at: index - 18)
                }
                else if index > 23 && index < 30
                {
                    per4name5Array.insert(studentName, at: index - 24)
                }
                else if index > 29 && index < 36
                {
                    per4name6Array.insert(studentName, at: index - 30)
                }
                else if index > 35 && index < 42
                {
                    per4name7Array.insert(studentName, at: index - 36)
                }
                else
                {
                    per4name8Array.insert(studentName, at: index - 42)
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
            
            cell.lblName1.text! = per4name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per4name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per4name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per4name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per4name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per4name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per4name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per4name8Array[indexPath.row]
            
            return cell
        }
        
    }

    @IBAction func RandomSeating(_ sender: Any)
    {
        per4name1Array = [" ", " ", " ", " "," ", " "]
        per4name2Array = [" ", " ", " ", " "," ", " "]
        per4name3Array = [" ", " ", " ", " "," ", " "]
        per4name4Array = [" ", " ", " ", " "," ", " "]
        per4name5Array = [" ", " ", " ", " "," ", " "]
        per4name6Array = [" ", " ", " ", " "," ", " "]
        per4name7Array = [" ", " ", " ", " "," ", " "]
        per4name8Array = [" "]
        
        let _:NSString
        var index:Int = 0
        
        var tempArray = [String]()
        
        var random = Int()
        
        sharedInstance.database!.open()
        
        let resultSet4: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '4';", withArgumentsIn: nil)
        
        if (resultSet4 != nil)
        {
            while resultSet4.next()
            {
                tempArray.append((resultSet4?.string(forColumn: "name"))!)
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
                per4name1Array.insert(tempArray[randomNums[i]], at: index)
            }
            else if index > 5 && index < 12
            {
                per4name2Array.insert(tempArray[randomNums[i]], at: index - 6)
            }
            else if index > 11 && index < 18
            {
                per4name3Array.insert(tempArray[randomNums[i]], at: index - 12)
            }
            else if index > 17 && index < 24
            {
                per4name4Array.insert(tempArray[randomNums[i]], at: index - 18)
            }
            else if index > 23 && index < 30
            {
                per4name5Array.insert(tempArray[randomNums[i]], at: index - 24)
            }
            else if index > 29 && index < 36
            {
                per4name6Array.insert(tempArray[randomNums[i]], at: index - 30)
            }
            else if index > 35 && index < 42
            {
                per4name7Array.insert(tempArray[randomNums[i]], at: index - 36)
            }
            else
            {
                per4name8Array.insert(tempArray[randomNums[i]], at: index - 42)
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
            
            cell.lblName1.text! = per4name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = per4name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = per4name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = per4name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = per4name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = per4name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = per4name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = per4name8Array[indexPath.row]
            
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
