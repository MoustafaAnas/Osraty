//
//  EnterCodeVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class EnterCodeVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var inbpu1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    var codeVerification:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "الكود"
        self.navigationItem.backButtonTitle = "عودة"
        
        inbpu1.delegate = self
        input2.delegate = self
        input3.delegate = self
        input4.delegate = self
        
        inbpu1.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input2.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input3.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        input4.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        inbpu1.becomeFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func resendActivateCode(_ sender: Any) {
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        let text = textField.text
        
        if (text?.utf16.count)! >= 1{
            switch textField{
            case inbpu1:
                input2.becomeFirstResponder()
            case input2:
                input3.becomeFirstResponder()
            case input3:
                input4.becomeFirstResponder()
            case input4:
                input4.resignFirstResponder()
                checkingVerification()
            default:
                break
            }
        }else{
            
        }
    }
    
     func checkingVerification() {
        
        codeVerification.append(inbpu1.text!)
        codeVerification.append(input2.text!)
        codeVerification.append(input3.text!)
        codeVerification.append(input4.text!)
        
        if codeVerification == "1234" {
            self.view.endEditing(true)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            FTIndicator.showSuccess(withMessage: "تم التفعيل بنجاح", userInteractionEnable: false )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
            
            FTIndicator.dismissProgress()
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
            
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                FTIndicator.showError(withMessage: "يوجد خطأ في الكود المرسل", userInteractionEnable: false )
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
                
                FTIndicator.dismissProgress()
                self.inbpu1.text = ""
                self.input2.text = ""
                self.input3.text = ""
                self.input4.text = ""
                self.codeVerification = ""
                self.inbpu1.becomeFirstResponder()
            }
        }
        
    }
}

