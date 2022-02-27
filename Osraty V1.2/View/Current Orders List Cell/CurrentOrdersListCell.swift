//
//  CurrentOrdersList.swift
//  Osraty
//
//  Created by NEW on 9/7/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class CurrentOrdersListCell: UITableViewCell {

    @IBOutlet weak var constructionName: UILabel!
    @IBOutlet weak var productsNumber: UILabel!
    @IBOutlet weak var totalProdutsPrice: UILabel!
    @IBOutlet weak var deliverPrice: UILabel!
    @IBOutlet weak var totalCash: UILabel!
    @IBOutlet weak var constructionPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showDetailsBtnPressed(_ sender: Any) {
          NotificationCenter.default.post(name: NSNotification.Name("showOrderDetails"), object: nil)
    }
    
}
