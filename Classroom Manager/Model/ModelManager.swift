//
//  ModelManager.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/29/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//
import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject
    {
        var database: FMDatabase? = nil
    
    

        class func getInstance() -> ModelManager
            {
                if(sharedInstance.database == nil)
                    {
                        sharedInstance.database = FMDatabase(path: "/Users/administrator/Documents/Swift/Classroom Manager/Classroom Manager/myData.sqlite")//.getPath("myData.sqlite"))
                    }
                return sharedInstance
            }
    
    func getAllTeacherData() -> NSMutableArray
                {
                    sharedInstance.database!.open()
    
                    let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("select * from users", withArgumentsIn: nil)
    
                    let marrTeacherInfo : NSMutableArray = NSMutableArray()
    
                    if (resultSet != nil)
                        {
                            while resultSet.next()
                                {
                                    let logInInfo : users = users()
    
                                    logInInfo.id = resultSet.string(forColumn: "id")
                                    logInInfo.email = resultSet.string(forColumn: "email")
                                    logInInfo.passw = resultSet.string(forColumn: "passw")
    
                                    marrTeacherInfo.add(logInInfo)
                                }
                        }
    
                    sharedInstance.database!.close()
            
                    return marrTeacherInfo
            }

    func addStudentData(_ myStudentData: students) -> Bool
        {
            sharedInstance.database!.open()
        
            let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO students (per, name, seat, color) VALUES (?, ?, ?, ?)", withArgumentsIn: [myStudentData.per, myStudentData.name, myStudentData.seat, myStudentData.color])
        
            return isInserted
        }
    
    func updateStudentData(_ myStudentData: students) -> Bool
        {
            sharedInstance.database!.open()
            
            let isUpdated = sharedInstance.database!.executeUpdate("UPDATE students SET per=?, name=?, seat=?, color=?", withArgumentsIn: [myStudentData.per, myStudentData.name, myStudentData.seat, myStudentData.color])
            
            sharedInstance.database!.close()
            
            return isUpdated
        }
    
    func addTeacherData(_ myTeacherData: users) -> Bool
        {
            sharedInstance.database!.open()
        
            let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO teachers (email, passw, lastName) VALUES (?, ?, ?)", withArgumentsIn: [myTeacherData.email, myTeacherData.passw, myTeacherData.lastName])
        
            sharedInstance.database!.close()
        
            return isInserted
        }
    
    func updateTeacherData(_ myTeacherData: users) -> Bool
        {
            sharedInstance.database!.open()
        
            let isUpdated = sharedInstance.database!.executeUpdate("UPDATE teachers SET email=?, passw=?, lastName=?, WHERE id=?", withArgumentsIn: [myTeacherData.email, myTeacherData.passw, myTeacherData.lastName, myTeacherData.id])
        
            sharedInstance.database!.close()
        
            return isUpdated
        }
   
    
    func addPeriodsData(_ myPeriodsData: periods) -> Bool
        {
            sharedInstance.database!.open()
        
            let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO periods (id, per) VALUES (?, ?)", withArgumentsIn: [myPeriodsData.id, myPeriodsData.per])
        
            sharedInstance.database!.close()
        
            return isInserted
        }
    
    func updatePeriodsData(_ myPeriodsData: periods) -> Bool
        {
            sharedInstance.database!.open()
        
            let isUpdated = sharedInstance.database!.executeUpdate("UPDATE periods SET id=?, per=?", withArgumentsIn: [myPeriodsData])
        
            sharedInstance.database!.close()
        
            return isUpdated
        }
    
    func deleteTeacherData(_ myTeacherData: users) -> Bool
        {
            sharedInstance.database!.open()
        
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM users WHERE id=?", withArgumentsIn: [myTeacherData.id])
        
            sharedInstance.database!.close()
        
            return isDeleted
        }
    
    func deletePeriodsData(_ myPeriodsData: periods) -> Bool
        {
            sharedInstance.database!.open()
        
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM periods WHERE id=?", withArgumentsIn: [myPeriodsData.id])
        
            sharedInstance.database!.close()
        
            return isDeleted
        }

    
    func deleteStudentData(_ myStudentData: students) -> Bool
        {
            sharedInstance.database!.open()
        
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM students WHERE students.per = ? AND students.name = ?", withArgumentsIn: [myStudentData.per, myStudentData.name])

            return isDeleted
        }
 
    func getAllStudentData() -> NSMutableArray
            {
                sharedInstance.database!.open()
                
                let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("select * from students;", withArgumentsIn: nil)

                let marrStudentInfo : NSMutableArray = NSMutableArray()
        
                if (resultSet != nil)
                    {
                        while resultSet.next()
                            {
                                let logInInfo : students = students()
                
                                logInInfo.per = resultSet.string(forColumn: "per")
                                logInInfo.name = resultSet.string(forColumn: "name")
       
                                marrStudentInfo.add(logInInfo)
                            }
                    }
                
                sharedInstance.database!.close()
        
                return marrStudentInfo
        }
}
