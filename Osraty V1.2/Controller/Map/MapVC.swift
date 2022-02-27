//
//  MapVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class MapVC: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRating: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        self.title = "الخريطه"
        
        self.profilePicture.layer.cornerRadius = (self.profilePicture.frame.size.height)/2.0
        self.profilePicture.layer.masksToBounds = true
    }
    
    
 
    
    


}
