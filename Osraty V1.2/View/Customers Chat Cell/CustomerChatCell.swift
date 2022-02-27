//
//  CustomerChatCell.swift
//  Osraty
//
//  Created by NEW on 9/8/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class CustomerChatCell: UITableViewCell {

    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
