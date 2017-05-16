//
//  MenuCell.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 03/10/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var lblMenuname: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    override func awakeFromNib()
        {
            super.awakeFromNib()
            // Initialization code
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
