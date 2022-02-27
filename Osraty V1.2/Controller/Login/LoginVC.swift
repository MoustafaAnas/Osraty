//
//  loginVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class LoginVC: UIViewController {

  
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var showPassword: UIButton!
    
    var passwordIsHidden = true
    
    override func viewDidLoad() {
        
        self.title = "تسجيل الدخول"
        self.navigationItem.backButtonTitle = "عودة"
        
        super.viewDidLoad()
        phoneNumber.setPadding()
        phoneNumber.setBottomBorder()
        
        password.setPadding()
        password.setBottomBorder()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.backgroundColor = UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func signin(_ sender: Any) {
        loginBtn.isEnabled = false
        
        phoneNumber.isEnabled = false
        password.isEnabled = false
        
        self.phoneNumber.text = ""
        self.password.text = ""
        
        phoneNumber.isEnabled = true
        password.isEnabled = true
        
        FTIndicator.showProgress(withMessage: "جاري التحميل", userInteractionEnable: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            FTIndicator.dismissProgress()
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as? tabBarVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        
        loginBtn.isEnabled = true
    }

    @IBAction func forgotPassword(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EnterCodeVC") as? EnterCodeVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func signup(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterationVC") as? RegisterationVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func showPasswordBtnPressed(_ sender: Any) {
        if passwordIsHidden == true {
            passwordIsHidden = false
            password.isSecureTextEntry = false
             showPassword.setImage(UIImage(named: "hidePassword"), for: .normal)
        }
        else {
            passwordIsHidden = true
            password.isSecureTextEntry = true
             showPassword.setImage(UIImage(named: "showPassword"), for: .normal)
        }
    }
    
}
