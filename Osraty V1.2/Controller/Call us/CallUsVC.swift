//
//  CallUsVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class CallUsVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailOrPhoneNumber: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var msgTitle: UITextField!
    @IBOutlet weak var msgDetails: UITextField!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sendMsg: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "اتصل بنا"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        emailOrPhoneNumber.setPadding()
        emailOrPhoneNumber.setBottomBorder()
        
        fullName.setPadding()
        fullName.setBottomBorder()
        
        msgTitle.setPadding()
        msgTitle.setBottomBorder()
        
        msgDetails.setPadding()
        msgDetails.setBottomBorder()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    @IBAction func sendMsg(_ sender: Any) {
        sendMsg.isEnabled = false
        
        self.emailOrPhoneNumber.endEditing(true)
        self.fullName.endEditing(true)
        self.msgTitle.endEditing(true)
        self.msgDetails.endEditing(true)
        
        emailOrPhoneNumber.isEnabled = false
        fullName.isEnabled = false
        msgTitle.isEnabled = false
        msgDetails.isEnabled = false
        
        self.emailOrPhoneNumber.text = ""
        self.fullName.text = ""
        self.msgTitle.text = ""
        self.msgDetails.text = ""
        
        sendMsg.isEnabled = true
        
        emailOrPhoneNumber.isEnabled = true
        fullName.isEnabled = true
        msgTitle.isEnabled = true
        msgDetails.isEnabled = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = -110
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 30
            self.view.layoutIfNeeded()
        }
    }
    
}
