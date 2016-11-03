//
//  TableViewCell.swift
//  alampractice
//
//  Created by Ashok Machineni on 11/2/16.
//  Copyright © 2016 Ashok Machineni. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var chImage: UIImageView!
    @IBOutlet var chTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
