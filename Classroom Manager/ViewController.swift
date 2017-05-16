//
//  ViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 2/21/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//
import UIKit
import MessageUI

var elCount:Int = 0
var index:Int = 0

var notesString = String()
var notesString1 = NSString()

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate, MFMailComposeViewControllerDelegate, UITextViewDelegate
{
    @IBOutlet weak var roundedCornerButton: UIButton!
    @IBOutlet weak var roundedCornerButton6: UIButton!
    @IBOutlet weak var roundedCornerButton5: UIButton!
    @IBOutlet weak var roundedCornerButton4: UIButton!
    @IBOutlet weak var roundedCornerButton3: UIButton!
    @IBOutlet weak var roundedCornerButton2: UIButton!
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var TableOneCollectionView: UICollectionView!
    @IBOutlet weak var TableTwoCollectionView: UICollectionView!
    @IBOutlet weak var TableThreeCollectionView: UICollectionView!
    @IBOutlet weak var TableFourCollectionView: UICollectionView!
    @IBOutlet weak var TableFiveCollectionView: UICollectionView!
    @IBOutlet weak var TableSixCollectionView: UICollectionView!
    @IBOutlet weak var TableSevenCollectionView: UICollectionView!
    @IBOutlet weak var TableEightCollectionView: UICollectionView!
    
    @IBOutlet weak var notes: UITextView!
    
    @IBOutlet weak var addRemoveStudentName: UITextField!
    
    var name1Array = [" ", " ", " ", " "," ", " "]
    var name2Array = [" ", " ", " ", " "," ", " "]
    var name3Array = [" ", " ", " ", " "," ", " "]
    var name4Array = [" ", " ", " ", " "," ", " "]
    var name5Array = [" ", " ", " ", " "," ", " "]
    var name6Array = [" ", " ", " ", " "," ", " "]
    var name7Array = [" ", " ", " ", " "," ", " "]
    var name8Array = [" "]
    
    var selectedItemCell = [IndexPath]()
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            roundedCornerButton?.layer.cornerRadius = 4
            roundedCornerButton2?.layer.cornerRadius = 4
            roundedCornerButton3?.layer.cornerRadius = 4
            roundedCornerButton4?.layer.cornerRadius = 4
            roundedCornerButton5?.layer.cornerRadius = 4
            roundedCornerButton6?.layer.cornerRadius = 4
        }
    
    override func viewWillAppear(_ animated: Bool)
        {
            self.period1ButtonTapped((Any).self)
        }
    
    func customLeftButtonAction()
    {
        self.revealViewController().revealToggle(animated: true)
    }

    @IBAction func period1ButtonTapped(_ sender: Any)
        {
            marrStudentsData = NSMutableArray()
            
            marrStudentsData = ModelManager.getInstance().getAllStudentData()
            
            let _:NSString
            var index:Int = 0
            
            var studentName = String()

            sharedInstance.database!.open()
            
            let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '1';", withArgumentsIn: nil)
            
            if (resultSet != nil)
                {
                    while resultSet.next()
                    {
                        studentName = (resultSet?.string(forColumn: "name"))!
                        
                        if index < 6
                            {
                                name1Array.insert(studentName, at: index)
                            }
                        else if index > 5 && index < 12
                            {
                                name2Array.insert(studentName, at: index - 6)
                            }
                        else if index > 11 && index < 18
                            {
                                name3Array.insert(studentName, at: index - 12)
                            }
                        else if index > 17 && index < 24
                            {
                                name4Array.insert(studentName, at: index - 18)
                            }
                        else if index > 23 && index < 30
                            {
                                name5Array.insert(studentName, at: index - 24)
                            }
                        else if index > 29 && index < 36
                            {
                                name6Array.insert(studentName, at: index - 30)
                            }
                        else if index > 35 && index < 42
                            {
                                name7Array.insert(studentName, at: index - 36)
                            }
                        else
                            {
                                name8Array.insert(studentName, at: index - 42)
                            }
                        index += 1

                    }
                }

            elCount = index
        
            sharedInstance.database!.close()
            UserDefaults.standard.synchronize()
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
            
                    cell.lblName1.text! = name1Array[indexPath.row]
            
                    return cell
                }
            else if collectionView == self.TableTwoCollectionView
                {
                    let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
                
                    cell.lblName2.text! = name2Array[indexPath.row]
                
                    return cell
                }
            else if collectionView == self.TableThreeCollectionView
                {
                    let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
                
                    cell.lblName3.text! = name3Array[indexPath.row]
                
                    return cell
                }
            else if collectionView == self.TableFourCollectionView
                {
                    let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
                
                    cell.lblName4.text! = name4Array[indexPath.row]
                
                    return cell
                }
            else if collectionView == self.TableFiveCollectionView
                {
                    let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
                
                    cell.lblName5.text! = name5Array[indexPath.row]
                
                    return cell
                }
            else if collectionView == self.TableSixCollectionView
                {
                    let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
                
                    cell.lblName6.text! = name6Array[indexPath.row]
                
                    return cell
                }
            else if collectionView == self.TableSevenCollectionView
                {
                    let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
                
                    cell.lblName7.text! = name7Array[indexPath.row]
                
                    return cell
                }
            else
                {
                    let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
                
                    cell.lblName8.text! = name8Array[indexPath.row]
                
                    return cell
                }
        }
    @IBAction func randomStudentPick(_ sender: Any)
        {
            var nameArray = [String]()
            
            marrStudentsData = NSMutableArray()
            
            marrStudentsData = ModelManager.getInstance().getAllStudentData()
            
            var studentName = String()
            var index:Int = 0
            
            sharedInstance.database!.open()
            
            let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '1';", withArgumentsIn: nil)
            
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
   
    @nonobjc func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UIColor
        {
            let cell = UIColor.gray

            return cell
        }

    @nonobjc func collectionView(collectionView: UICollectionView, shouldSelectItemAt indexPath: NSIndexPath) -> Bool
        {
            if let selectedItems = collectionView.indexPathsForSelectedItems
                {
                    selectedItemCell = selectedItems
                    
                    print(selectedItems)
                    print(selectedItemCell)
                    if selectedItems.contains(indexPath as IndexPath)
                        {
                            collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
                            return false
                        }
                    if selectedItems.count > 1
                    {
                        collectionView.reloadItems(at: selectedItems.reversed())
                        collectionView.reloadData()
                    }
                }
        
            return true
        }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        _ = selectedItemCell.first
        _ = selectedItemCell.last
        
         collectionView.reloadData()
    }
    
    @IBAction func SwapSeatis(_ sender: Any)
        {
            print("swap button tapped")
        }

    @IBAction func notesButton(_ sender: Any)
        {
            print(notesString)
            
            notes.text = "test"
            
            print("notes button tapped")
        }

    
    @IBAction func RandomSeating(_ sender: Any)
        {
            name1Array = [" ", " ", " ", " "," ", " "]
            name2Array = [" ", " ", " ", " "," ", " "]
            name3Array = [" ", " ", " ", " "," ", " "]
            name4Array = [" ", " ", " ", " "," ", " "]
            name5Array = [" ", " ", " ", " "," ", " "]
            name6Array = [" ", " ", " ", " "," ", " "]
            name7Array = [" ", " ", " ", " "," ", " "]
            name8Array = [" "]
            
            let _:NSString
            var index:Int = 0
            
            var tempArray = [String]()
            
            var random = Int()
            
            sharedInstance.database!.open()
            
            let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '1';", withArgumentsIn: nil)
            
            if (resultSet != nil)
                {
                    while resultSet.next()
                        {
                            tempArray.append((resultSet?.string(forColumn: "name"))!)
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
                        name1Array.insert(tempArray[randomNums[i]], at: index)
                    }
                    else if index > 5 && index < 12
                    {
                        name2Array.insert(tempArray[randomNums[i]], at: index - 6)
                    }
                    else if index > 11 && index < 18
                    {
                        name3Array.insert(tempArray[randomNums[i]], at: index - 12)
                    }
                    else if index > 17 && index < 24
                    {
                        name4Array.insert(tempArray[randomNums[i]], at: index - 18)
                    }
                    else if index > 23 && index < 30
                    {
                        name5Array.insert(tempArray[randomNums[i]], at: index - 24)
                    }
                    else if index > 29 && index < 36
                    {
                        name6Array.insert(tempArray[randomNums[i]], at: index - 30)
                    }
                    else if index > 35 && index < 42
                    {
                        name7Array.insert(tempArray[randomNums[i]], at: index - 36)
                    }
                    else
                    {
                        name8Array.insert(tempArray[randomNums[i]], at: index - 42)
                    }
                    index += 1
                }

            elCount = index
            
            sharedInstance.database!.close()
            
            UserDefaults.standard.synchronize()

            super.loadView()
        }
    
    func MycollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = name8Array[indexPath.row]
            
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
        
        logInInfo.name = addRemoveStudentName.text!
        
        logInInfo.per = "1"
        
        if sharedInstance.deleteStudentData(logInInfo) == true
        {
            print("\n\n\n\nThe student ")
            print(addRemoveStudentName)
            print("was added\n\n\n")
        }

            let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM students WHERE per = '1';", withArgumentsIn: nil)
        
            if (resultSet != nil)
            {
                while resultSet.next()
                {
                    studentName = (resultSet?.string(forColumn: "name"))!
                    
                    if index < 6 && studentName != addRemoveStudentName.text
                    {
                        name1Array.insert(studentName, at: index)
                        index += 1
                    }
                    else if index > 5 && index < 12 && studentName != addRemoveStudentName.text
                    {
                        name2Array.insert(studentName, at: index - 6)
                        index += 1
                    }
                    else if index > 11 && index < 18 && studentName != addRemoveStudentName.text
                    {
                        name3Array.insert(studentName, at: index - 12)
                        index += 1
                    }
                    else if index > 17 && index < 24 && studentName != addRemoveStudentName.text
                    {
                        name4Array.insert(studentName, at: index - 18)
                        index += 1
                    }
                    else if index > 23 && index < 30 && studentName != addRemoveStudentName.text
                    {
                        name5Array.insert(studentName, at: index - 24)
                        index += 1
                    }
                    else if index > 29 && index < 36 && studentName != addRemoveStudentName.text
                    {
                        name6Array.insert(studentName, at: index - 30)
                        index += 1
                    }
                    else if index > 35 && index < 42 && studentName != addRemoveStudentName.text
                    {
                        name7Array.insert(studentName, at: index - 36)
                        index += 1
                    }
                    else if studentName != addRemoveStudentName.text
                    {
                        name8Array.insert(studentName, at: index - 42)
                        index += 1
                    }
                }
            }
            
            elCount = index
        
            UserDefaults.standard.synchronize()
            
            super.loadView()
    
        }
    
    func NewcollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = name8Array[indexPath.row]
            
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
            
            logInInfo.name = addRemoveStudentName.text!
            
            logInInfo.per = "1"
            
            if sharedInstance.addStudentData(logInInfo) == true
                {
                    print("\n\n\n\nThe student ")
                    print(addRemoveStudentName)
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
                        name1Array.insert(studentName, at: index)
                    }
                    else if index > 5 && index < 12
                    {
                        name2Array.insert(studentName, at: index - 6)
                    }
                    else if index > 11 && index < 18
                    {
                        name3Array.insert(studentName, at: index - 12)
                    }
                    else if index > 17 && index < 24
                    {
                        name4Array.insert(studentName, at: index - 18)
                    }
                    else if index > 23 && index < 30
                    {
                        name5Array.insert(studentName, at: index - 24)
                    }
                    else if index > 29 && index < 36
                    {
                        name6Array.insert(studentName, at: index - 30)
                    }
                    else if index > 35 && index < 42
                    {
                        name7Array.insert(studentName, at: index - 36)
                    }
                    else
                    {
                        name8Array.insert(studentName, at: index - 42)
                    }
                    index += 1
                    
                }
            }
            
            if index < 6
            {
                name1Array.insert(addRemoveStudentName.text!, at: index)
            }
            else if index > 5 && index < 12
            {
                name2Array.insert(addRemoveStudentName.text!, at: index - 6)
            }
            else if index > 11 && index < 18
            {
                name3Array.insert(addRemoveStudentName.text!, at: index - 12)
            }
            else if index > 17 && index < 24
            {
                name4Array.insert(addRemoveStudentName.text!, at: index - 18)
            }
            else if index > 23 && index < 30
            {
                name5Array.insert(addRemoveStudentName.text!, at: index - 24)
            }
            else if index > 29 && index < 36
            {
                name6Array.insert(addRemoveStudentName.text!, at: index - 30)
            }
            else if index > 35 && index < 42
            {
                name7Array.insert(addRemoveStudentName.text!, at: index - 36)
            }
            else
            {
                name8Array.insert(addRemoveStudentName.text!, at: index - 42)
            }
            index += 1
            
            elCount = index
            
            UserDefaults.standard.synchronize()
            
            super.loadView()
        }
    
    func New2collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.TableOneCollectionView
        {
            let cell:TableOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat1", for: indexPath) as! TableOneCollectionViewCell
            
            cell.lblName1.text! = name1Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableTwoCollectionView
        {
            let cell:TableTwoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat7", for: indexPath) as! TableTwoCollectionViewCell
            
            cell.lblName2.text! = name2Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableThreeCollectionView
        {
            let cell:TableThreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat13", for: indexPath) as! TableThreeCollectionViewCell
            
            cell.lblName3.text! = name3Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFourCollectionView
        {
            let cell:TableFourCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat19", for: indexPath) as! TableFourCollectionViewCell
            
            cell.lblName4.text! = name4Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableFiveCollectionView
        {
            let cell:TableFiveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat25", for: indexPath) as! TableFiveCollectionViewCell
            
            cell.lblName5.text! = name5Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSixCollectionView
        {
            let cell:TableSixCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat31", for: indexPath) as! TableSixCollectionViewCell
            
            cell.lblName6.text! = name6Array[indexPath.row]
            
            return cell
        }
        else if collectionView == self.TableSevenCollectionView
        {
            let cell:TableSevenCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat37", for: indexPath) as! TableSevenCollectionViewCell
            
            cell.lblName7.text! = name7Array[indexPath.row]
            
            return cell
        }
        else
        {
            let cell:TableEightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "seat43", for: indexPath) as! TableEightCollectionViewCell
            
            cell.lblName8.text! = name8Array[indexPath.row]
            
            return cell
        }
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any)
        {
            marrTeachersData.removeAllObjects()
            marrStudentsData.removeAllObjects()
            userEmail.removeAll()
        }
    
    func displayMyAlertMessage(userMessage:String)
        {
            let myAlert = UIAlertController(title:"Picked Student", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
            myAlert.addAction(okAction)
        
            self.present(myAlert, animated:true, completion:nil)
        }
    
    func showMailComposerWith(attachmentURL: String)
        {
            if (MFMailComposeViewController.canSendMail())
                {
                    let subject = "Classroom Report CSV"
                    let messageBody = "Thanks for using Classroom Management"
                    let toRecipients = [userEmail]
                    
                    let mailComposer = MFMailComposeViewController()
                    
                    mailComposer.mailComposeDelegate = self
                    mailComposer.setSubject(subject)
                    mailComposer.setMessageBody(messageBody, isHTML: false)
                    mailComposer.setToRecipients(toRecipients)

                    if let filePath = Bundle.main.path(forResource: "classReport", ofType: "csv")
                        {
                            print("File path loaded.")
                    
                            if let fileData = NSData(contentsOfFile: filePath)
                                {
                                    mailComposer.addAttachmentData(fileData as Data, mimeType: "csv", fileName: "classReport")
                                    print("File data loaded.")
                                }
                        }
                    self.present(mailComposer, animated: true, completion: nil)
                }
        }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func exportButtonTapped(_ sender: Any)
    {
        showMailComposerWith(attachmentURL: "/Users/administrator/Documents/Swift/Classroom Manager/Classroom Manager/classReport.csv")
    }
}
