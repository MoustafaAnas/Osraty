//
//  CreditCardCell.swift
//  Osraty
//
//  Created by NEW on 9/10/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class CreditCardCell: UITableViewCell {

   
    
    @IBOutlet weak var circularIconTwo: UIButton!
    @IBOutlet weak var circularIconOne: UIButton!
    @IBOutlet weak var creditCardNumber: UILabel!
    @IBOutlet weak var creditCardPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circularIconOne.layer.cornerRadius = (self.circularIconOne.frame.size.height)/2.0
        self.circularIconOne.layer.masksToBounds = true
        
        self.circularIconTwo.layer.cornerRadius = (self.circularIconTwo.frame.size.height)/2.0
        self.circularIconTwo.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editBtn(_ sender: Any) {
    }
    @IBAction func deleteBtn(_ sender: Any) {
    }
    
}
