//
//  RegisterationVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class RegisterationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var confirmUserPassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var showPassword: UIButton!
    
    var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "التسجيل"
        self.navigationItem.backButtonTitle = "عودة"
        
       userEmail.setPadding()
        userEmail.setBottomBorder()
        
        phoneNumber.setPadding()
        phoneNumber.setBottomBorder()
        
        userPassword.setPadding()
        userPassword.setBottomBorder()
        
        confirmUserPassword.setPadding()
        confirmUserPassword.setBottomBorder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBAction func nextButtonPressed(_ sender: Any) {
      
            
            nextBtn.isEnabled = false
            
            let providedEmailAddress = userEmail.text
            
            let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
            
            if isEmailAddressValid
            {
                print("Email address is valid")
                
           
                userPassword.isEnabled = false
                userEmail.isEnabled = false
                phoneNumber.isEnabled = false
                confirmUserPassword.isEnabled = false
                
                self.userEmail.text = ""
                self.userPassword.text = ""
                self.phoneNumber.text = ""
                self.confirmUserPassword.text = ""
                
                userPassword.isEnabled = true
                userEmail.isEnabled = true
                phoneNumber.isEnabled = true
                confirmUserPassword.isEnabled = true
          
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "CarRegisterationVC") as? CarRegisterationVC
                self.navigationController?.pushViewController(vc!, animated: true)
                
            }
                
            else {
                print("Email address is not valid")
                
                FTIndicator.showError(withMessage: "يوجد خطأ في عنوان البريد المدخل", userInteractionEnable: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                    FTIndicator.dismissProgress()
                }
            }
            
            nextBtn.isEnabled = true
        }
        
        func isValidEmailAddress(emailAddressString: String) -> Bool {
            
            var returnValue = true
            let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
            
            do {
                let regex = try NSRegularExpression(pattern: emailRegEx)
                let nsString = emailAddressString as NSString
                let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
                
                if results.count == 0
                {
                    returnValue = false
                }
                
            } catch let error as NSError {
                print("invalid regex: \(error.localizedDescription)")
                returnValue = false
            }
            
            return  returnValue
        }
        
    
    @IBAction func alreadyOwnAccountBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func showPasswordBtnPressed(_ sender: Any) {
        
            if passwordIsHidden == true {
                passwordIsHidden = false
                userPassword.isSecureTextEntry = false
                confirmUserPassword.isSecureTextEntry = false
                showPassword.setImage(UIImage(named: "hidePassword"), for: .normal)
            }
            else {
                passwordIsHidden = true
                userPassword.isSecureTextEntry = true
                confirmUserPassword.isSecureTextEntry = true
                showPassword.setImage(UIImage(named: "showPassword"), for: .normal)
            }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 0
            self.heightConstraint2.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 40
            self.heightConstraint2.constant = 40
            self.view.layoutIfNeeded()
        }
    }
}
