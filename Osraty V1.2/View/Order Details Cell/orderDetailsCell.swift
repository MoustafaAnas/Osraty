//
//  orderDetailsCell.swift
//  Osraty
//
//  Created by NEW on 9/10/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class orderDetailsCell: UITableViewCell {

    @IBOutlet weak var numberOfPieces: UILabel!
    @IBOutlet weak var nameOfOrder: UILabel!
    @IBOutlet weak var priceOfOrder: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
