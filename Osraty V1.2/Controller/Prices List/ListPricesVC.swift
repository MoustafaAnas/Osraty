//
//  ListPricesVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class ListPricesVC: UIViewController {

    @IBOutlet weak var listPricesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "قائمة الاسعار"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        listPricesText.isUserInteractionEnabled = false
        
    }
    

 
    

}
