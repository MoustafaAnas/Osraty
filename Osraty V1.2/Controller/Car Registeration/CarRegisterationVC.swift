//
//  CarRegisterationVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class CarRegisterationVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var carNumber: UITextField!
    @IBOutlet weak var carType: UITextField!
    @IBOutlet weak var licenseImage: UIImageView!
    @IBOutlet weak var acceptTermsBtn: UIButton!
    @IBOutlet weak var termsAndConditions: UITextView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet var termsAndConditionsView: UIView!
    @IBOutlet weak var registerationBtn: UIButton!
    @IBOutlet weak var heightConstarint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint2: NSLayoutConstraint!
    
    var btnIsSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "متابعة التسجيل"
        self.navigationItem.backButtonTitle = "عودة"
        
        visualEffect.alpha = 0.0
       
        carNumber.setPadding()
        carNumber.setBottomBorder()
        
        carType.setPadding()
        carType.setBottomBorder()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

   
    @IBAction func addLicenseImageBtnPressed(_ sender: Any) {
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
            licenseImage.image = image
        }
        else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func acceptConditionsBtnPressed(_ sender: Any) {
        
        if btnIsSelected {
            btnIsSelected = false
             acceptTermsBtn.setTitleColor(UIColor(red:78/255, green:78/255, blue:78/255, alpha: 1), for: .normal)
        }

        else {
            btnIsSelected = true
        acceptTermsBtn.setTitleColor(UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func displayTermsAndConditionsBtnPressed(_ sender: Any) {
        popupIn(popupName: termsAndConditionsView)
    }
    
    @IBAction func registerationBtnPressed(_ sender: Any) {
        registerationBtn.isEnabled = false
        
        carType.isEnabled = false
        carNumber.isEnabled = false
        
        self.carNumber.text = ""
        self.carType.text = ""
        licenseImage.image = UIImage(named: "")
        
        carType.isEnabled = true
        carNumber.isEnabled = true
        
        FTIndicator.showSuccess(withMessage: "تم التسجيل بنجاح", userInteractionEnable: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            FTIndicator.dismissProgress()
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EnterCodeVC") as? EnterCodeVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        registerationBtn.isEnabled = true
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func closePopupBtnPressed(_ sender: Any) {
        popupOut(popupName: termsAndConditionsView)
    }
    
    func popupIn(popupName: UIView) {
        
        self.view.addSubview(popupName)
        popupName.center = self.view.center
        
        popupName.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupName.alpha = 0.0
        
        UIView.animate(withDuration: 0.4){
            self.visualEffect.alpha = 0.40
            popupName.alpha = 1
            popupName.transform = CGAffineTransform.identity
        }
    }
    
    func popupOut(popupName: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            popupName.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            popupName.alpha = 0
            
            self.visualEffect.alpha = 0
        }) {(success: Bool) in
            
            popupName.removeFromSuperview()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstarint.constant = 0
            self.heightConstraint2.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstarint.constant = 40
            self.heightConstraint2.constant = 20
            self.view.layoutIfNeeded()
        }
    }
}
