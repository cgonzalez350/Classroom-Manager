//
//  Util.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/29/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    class func getPath(_ fileName: String) -> String {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path
    }
    
    class func copyFile(_ fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
            
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            //let alert: UIAlertView = UIAlertView()
            let alert = UIAlertController(title: "Error Occured", message:"This feature isn't available right now", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            
            if (error != nil)
                {
                alert.title = "Error Occured"
                alert.message = error?.localizedDescription
            } else {
                alert.title = "Successfully Copy"
                alert.message = "Your database copy successfully"
            }
            
            alert.transitioningDelegate = nil
            alert.addAction(action)
        }
    }
}
