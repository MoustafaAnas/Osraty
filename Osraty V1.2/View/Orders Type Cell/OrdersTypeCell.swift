//
//  OrdersTypeCell.swift
//  Osraty
//
//  Created by NEW on 9/7/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class OrdersTypeCell: UITableViewCell {

    @IBOutlet weak var orderType: UILabel!
    @IBOutlet weak var ordersNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
