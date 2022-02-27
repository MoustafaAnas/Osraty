//
//  SplashVC.swift
//  Osraty
//
//  Created by NEW on 9/11/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "naviControler") as! naviControler
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }

    

   
}
