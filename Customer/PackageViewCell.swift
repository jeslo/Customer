//
//  PackageViewCell.swift
//  Customer
//
//  Created by Joe on 28/09/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

class PackageViewCell: UITableViewCell {
    
    @IBOutlet weak var packageNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
