//
//  LastOrdersListCell.swift
//  Osraty
//
//  Created by NEW on 9/7/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class LastOrdersListCell: UITableViewCell {

    @IBOutlet weak var constructionPic: UIImageView!
    @IBOutlet weak var constructionName: UILabel!
    @IBOutlet weak var productsNumber: UILabel!
    @IBOutlet weak var totalProductsPrice: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var totalCash: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showLastOrdersBtnPressed(_ sender: Any) {
          NotificationCenter.default.post(name: NSNotification.Name("showOrderDetails"), object: nil)
    }
}
