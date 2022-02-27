//
//  TermsAndConditionsVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class TermsAndConditionsVC: UIViewController {

    @IBOutlet weak var termsAndConditionsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الشروط و الاحكام"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        termsAndConditionsText.isUserInteractionEnabled = false

    }
    

    
    

}
