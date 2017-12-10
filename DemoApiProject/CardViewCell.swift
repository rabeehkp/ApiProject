//
//  CardViewCell.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 05/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class CardViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: -Outlets
    
    @IBOutlet weak var TaskIdLabal: UILabel!
    @IBOutlet weak var TaskHeaderLabal: UILabel!
    
    @IBOutlet weak var myView: UIView!

    
}
