//
//  CellForBtn.swift
//  Preferences
//
//  Created by USER on 10/19/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class CellForBtn: UITableViewCell {
    
    @IBOutlet weak var cellBtn: UIButton!
    @IBOutlet weak var cellLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
