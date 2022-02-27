//
//  AddCreditCardVC.swift
//  Osraty
//
//  Created by NEW on 9/8/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class CreditCardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var creditCardTypes: [UIButton]!
    @IBOutlet weak var heaightConstrain: NSLayoutConstraint!
    @IBOutlet weak var creditCardTV: UITableView!
    @IBOutlet weak var chooseCreditCardTypeBtn: UIButton!
    @IBOutlet weak var containerOne: UIView!
    @IBOutlet var addCreditCardView: UIView!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var cardPassword: UITextField!
    
    @IBOutlet weak var ownerName: UITextField!
    var creditCardList = [String]()
    @IBOutlet weak var cardExpireDate: UITextField!
    @IBOutlet weak var blurVE: UIVisualEffectView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var showPassword: UIButton!
    
    var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "البطاقات الائتمانيه"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        blurVE.alpha = 0.0
       creditCardTV.register(UINib(nibName: "CreditCardCell", bundle: nil) , forCellReuseIdentifier: "cell")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CreditCardCell
        creditCardList = ["9456732875577892773","seconed Card ID"]
        cell.creditCardNumber.text = creditCardList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(55)
    }
    
    @IBAction func addNewCreditBtnPressed(_ sender: Any) {
        popupIn(popupName: addCreditCardView)
    }
    @IBAction func chooseCreditCardType(_ sender: Any) {
        closeDropDownMenu()
    }
    
    enum creditCard: String {
        case masterCard = "ماستر كارد"
        case visa = "فيزا"
        case payPal = "باي بال"
    }
    
    @IBAction func creditCardTaped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let creditCardTyp = creditCard(rawValue: title) else {
            return
        }
        switch creditCardTyp {
        case .masterCard: chooseCreditCardTypeBtn.setTitle("ماستر كارد", for: .normal)
        containerOne.isHidden = false
        cardNumber.isEnabled = true
        cardPassword.isEnabled = true
        cardExpireDate.isEnabled = true
        ownerName.isEnabled = true
        chooseCreditCardTypeBtn.setImage(UIImage(named: ""), for: .normal)
            closeDropDownMenu()
        case .visa: chooseCreditCardTypeBtn.setTitle("فيزا", for: .normal)
        containerOne.isHidden = false
        cardNumber.isEnabled = true
        cardPassword.isEnabled = true
        cardExpireDate.isEnabled = true
        ownerName.isEnabled = true
        chooseCreditCardTypeBtn.setImage(UIImage(named: ""), for: .normal)
            closeDropDownMenu()
        case .payPal:chooseCreditCardTypeBtn.setTitle("باي بال", for: .normal)
        chooseCreditCardTypeBtn.setImage(UIImage(named: ""), for: .normal)
        containerOne.isHidden = true
        cardNumber.isEnabled = true
        cardPassword.isEnabled = true
        cardExpireDate.isEnabled = false
        ownerName.isEnabled = false
            closeDropDownMenu()
        }
        
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        addBtn.isEnabled = false
        
        cardNumber.isEnabled = false
        cardPassword.isEnabled = false
        cardExpireDate.isEnabled = false
        ownerName.isEnabled = false
        
        self.cardNumber.text = ""
        self.cardPassword.text = ""
        self.cardExpireDate.text = ""
        self.ownerName.text = ""
        
        addBtn.isEnabled = true
        
        FTIndicator.showSuccess(withMessage: "تم اضافة بطاقه بنجاح", userInteractionEnable: false )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            FTIndicator.dismissProgress()
            self.popupOut(popupName: self.addCreditCardView)
            self.chooseCreditCardTypeBtn.setTitle("اختر نوع البطاقه", for: .normal)
            self.chooseCreditCardTypeBtn.setImage(UIImage(named: "drop-down-arrow"), for: .normal)
            self.heaightConstrain.constant = CGFloat(self.creditCardList.count * 55)
        }
        
        
        
    }
    
    
    func closeDropDownMenu (){
        UIView.animate(withDuration: 0.3) {
            self.creditCardTypes.forEach { (button) in
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
            
        }
    }
    @IBAction func closePopup(_ sender: Any) {
        popupOut(popupName: addCreditCardView)
        chooseCreditCardTypeBtn.setTitle("اختر نوع البطاقه", for: .normal)
        chooseCreditCardTypeBtn.setImage(UIImage(named: "drop-down-arrow"), for: .normal)
    }
    
    func popupIn(popupName: UIView) {
        
        self.view.addSubview(popupName)
        popupName.center = self.view.center
        
        popupName.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupName.alpha = 0.0
        
        UIView.animate(withDuration: 0.4){
            self.blurVE.alpha = 0.60
            popupName.alpha = 1
            popupName.transform = CGAffineTransform.identity
        }
    }
    
    func popupOut(popupName: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            popupName.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            popupName.alpha = 0
            
            self.blurVE.alpha = 0
        }) {(success: Bool) in
            
            popupName.removeFromSuperview()
        }
    }
    
    @IBAction func showPasswordBtnPressed(_ sender: Any) {
        if passwordIsHidden == true {
            passwordIsHidden = false
            cardPassword.isSecureTextEntry = false
            showPassword.setImage(UIImage(named: "hidePassword"), for: .normal)
        }
        else {
            passwordIsHidden = true
            cardPassword.isSecureTextEntry = true
            showPassword.setImage(UIImage(named: "showPassword"), for: .normal)
        }
    }
}
