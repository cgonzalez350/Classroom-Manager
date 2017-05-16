//
//  menuViewController.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 03/10/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
        
            ManuNameArray = ["Home","Add","Remove","Rename"]
        
            iconArray = [UIImage(named:"home")!,UIImage(named:"plus")!,UIImage(named:"minus")!,UIImage(named:"remove")!]
        
            imgProfile.layer.borderWidth = 2
            imgProfile.layer.borderColor = UIColor.green.cgColor
            imgProfile.layer.cornerRadius = 50
        
            imgProfile.layer.masksToBounds = false
            imgProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.lblMenuname.text!)
        if cell.lblMenuname.text! == "Home"
        {
            print("Home Tapped")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
    }
}
