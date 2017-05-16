//
//  attendanceTableViewCell.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/19/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class attendanceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendanceSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
