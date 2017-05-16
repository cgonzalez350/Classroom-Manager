//
//  TableFourCollectionViewCell.swift
//  Classroom Manager
//
//  Created by Carlos Gonzalez on 4/14/17.
//  Copyright © 2017 Carlos Gonzalez. All rights reserved.
//

import UIKit

class TableFourCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName4: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            self.layer.borderColor = isSelected ? UIColor.gray.cgColor : UIColor.clear.cgColor
            self.layer.backgroundColor = isSelected ? UIColor.gray.cgColor : UIColor.clear.cgColor
        }
    }
}
