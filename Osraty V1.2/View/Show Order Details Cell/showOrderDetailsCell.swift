//
//  showOrderDetailsCell.swift
//  Osraty
//
//  Created by NEW on 9/10/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class showOrderDetailsCell: UITableViewCell {

    @IBOutlet weak var redPoint: UIImageView!
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.redPoint.layer.cornerRadius = (self.redPoint.frame.size.height)/2.0
        self.redPoint.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
