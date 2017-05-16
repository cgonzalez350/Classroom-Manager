//
//  myData.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/29/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class periods: NSObject
    {
        var id: String = String()
        var per: String = String()
    }

class students: NSObject
    {
        var per: String = String()
        var name: String = String()
        var seat: String = String()
        var color: String = String()
    }

class users: NSObject
    {
        var id: String = String()
        var email: String = String()
        var passw: String = String()
        var lastName: String = String()
    }
