//
//  ProfileVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class ProfileVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var profilePicBtn: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userPhoneNumber: UITextField!
    @IBOutlet weak var userMail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var containerOne: UIView!
    @IBOutlet weak var personalInfo: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        self.title = "الحساب الشخصي"
        self.profilePicImage.layer.cornerRadius = (self.profilePicImage.frame.size.height)/2.0
        self.profilePicImage.layer.masksToBounds = true
        
        self.profilePicBtn.layer.cornerRadius = (self.profilePicBtn.frame.size.height)/2.0
        self.profilePicBtn.layer.masksToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    @IBAction func profilePicBtnSelected(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is Complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            profilePicImage.image = image
        }
        else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editProfileBtnSelected(_ sender: Any) {
        self.title = "تعديل الحساب الشخصي"
        self.navigationItem.setHidesBackButton(true, animated:true);
        saveBtn.isHidden = false
        profilePicImage.isHidden = true
        profilePicBtn.isHidden = false
        userName.isEnabled = true
        userAddress.isEnabled = true
        userPhoneNumber.isEnabled = true
        userMail.isEnabled = true
        userPassword.isEnabled = true
        userPassword.isSecureTextEntry = false
        editBtn.isEnabled = false
        self.containerOne.layer.backgroundColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        editBtn.setTitleColor(UIColor(red:14/255, green:76/255, blue:77/255, alpha: 1), for: .normal)
        personalInfo.setTitleColor(UIColor(red:14/255, green:76/255, blue:77/255, alpha: 1), for: .normal)
        
        
    }
    @IBAction func saveBtnSelected(_ sender: Any) {
        
        saveBtn.isEnabled = false
      
        let providedEmailAddress = userMail.text
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
            
            saveBtn.isHidden = true
            self.title = "الحساب الشخصي"
            self.navigationItem.setHidesBackButton(false, animated:true);
            saveBtn.isHidden = true
            profilePicImage.isHidden = false
            profilePicBtn.isHidden = true
            userName.isEnabled = false
            userAddress.isEnabled = false
            userPhoneNumber.isEnabled = false
            userMail.isEnabled = false
            userPassword.isEnabled = false
            userPassword.isSecureTextEntry = true
            editBtn.isEnabled = true
            self.containerOne.layer.backgroundColor = UIColor(red:14/255, green:76/255, blue:77/255, alpha: 1).cgColor
            editBtn.setTitleColor(UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1), for: .normal)
            personalInfo.setTitleColor(UIColor(red:14/255, green:76/255, blue:77/255, alpha: 1), for: .normal)
            
            FTIndicator.showSuccess(withMessage: "تم الحفظ بنجاح", userInteractionEnable: false )
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                FTIndicator.dismissProgress()
            }
            
        }
            
        else {
            print("Email address is not valid")
            FTIndicator.showError(withMessage: "يوجد خطأ في عنوان البريد المدخل", userInteractionEnable: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                FTIndicator.dismissProgress()
            }
        }
        
        saveBtn.isEnabled = true
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
  
}
