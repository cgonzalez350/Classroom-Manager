//
//  MessageViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 3/10/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
