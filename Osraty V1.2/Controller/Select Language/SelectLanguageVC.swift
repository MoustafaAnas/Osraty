//
//  selectLanguageVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class SelectLanguageVC: UIViewController {

    
   
    @IBOutlet weak var chooseDistinctBT: UIButton!
    @IBOutlet weak var chooseCityBtn: UIButton!
    @IBOutlet weak var chooseLanguageBtn: UIButton!
    @IBOutlet weak var lastViewBtn: UIButton!
    @IBOutlet weak var nextVCBtn: UIButton!
    @IBOutlet var distinctsBtns: [UIButton]!
    @IBOutlet var languageBtns: [UIButton]!
    @IBOutlet var cityBtns: [UIButton]!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var seconedView: UIView!
    @IBOutlet weak var firstViewBtn: UIButton!
    @IBOutlet weak var seconedPageControl: UIPageControl!
    @IBOutlet weak var thirdPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "اللغه"
        self.navigationItem.backButtonTitle = "عودة"
        
        self.firstViewBtn.layer.cornerRadius = (self.firstViewBtn.frame.size.height)/2.0
        self.firstViewBtn.layer.masksToBounds = true
        
        self.nextVCBtn.layer.cornerRadius = (self.nextVCBtn.frame.size.height)/2.0
        self.nextVCBtn.layer.masksToBounds = true
        
        self.lastViewBtn.layer.cornerRadius = (self.lastViewBtn.frame.size.height)/2.0
        self.lastViewBtn.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func chooseLanguageBtnPressed(_ sender: Any) {
        closeLanguageDropDownMenu()
    }
    
    enum languages: String {
        case arabic = "العربيه"
        case english = "English"
    }

    @IBAction func languageBtnTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let languageSelected = languages (rawValue: title) else {
            return
        }
        
        switch languageSelected {
        case .arabic: chooseLanguageBtn.setTitle("العربيه", for: .normal)
        chooseLanguageBtn.setImage(UIImage(named: ""), for: .normal)
        closeLanguageDropDownMenu()
        
        case .english: chooseLanguageBtn.setTitle("English", for: .normal)
        chooseLanguageBtn.setImage(UIImage(named: ""), for: .normal)
        closeLanguageDropDownMenu()
        }
    }
    
    @IBAction func chooseCityBtnPressed(_ sender: Any) {
        closeCityDropDownMenu()
    }
    
    enum cities: String {
        case mekka = "مكه"
        case elmadinah = "المدينه"
    }
    
    @IBAction func cirtTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let citySelected = cities (rawValue: title) else {
            return
        }
        
        switch citySelected {
        case .mekka: chooseCityBtn.setTitle("مكه", for: .normal)
        chooseCityBtn.setImage(UIImage(named: ""), for: .normal)
        closeCityDropDownMenu()
            
        case .elmadinah: chooseCityBtn.setTitle("المدينه", for: .normal)
        chooseCityBtn.setImage(UIImage(named: ""), for: .normal)
        closeCityDropDownMenu()
        }
    }
    
    
    @IBAction func distinctBTPressed(_ sender: Any) {
        closeDistinctDrop()
    }
    
    enum distinct: String {
        case c1 = "المنطقه ١"
        case c2 = "المنطقه ٢"
    }
    
    @IBAction func distinctBtnTapped(_ sender: UIButton) {
        print("distinct")
        guard let title = sender.currentTitle, let distinctSelected = distinct (rawValue: title) else {
            return
        }
        
        switch distinctSelected{
        case .c1: chooseDistinctBT.setTitle("المنطقه ١", for: .normal)
        chooseDistinctBT.setImage(UIImage(named: ""), for: .normal)
        closeDistinctDrop()
            
        case .c2: chooseDistinctBT.setTitle("المنطقه ٢", for: .normal)
        chooseDistinctBT.setImage(UIImage(named: ""), for: .normal)
        closeDistinctDrop()
            
        }
    }
    
    
    @IBAction func firstViewBtnPressed(_ sender: UIButton) {
        
        self.firstView.isHidden = true
        self.seconedView.isHidden = false
        self.seconedPageControl.isHidden = true
        self.thirdPageControl.isHidden = false
       
        
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        self.firstView.isHidden = false
        self.seconedView.isHidden = true
        self.seconedPageControl.isHidden = false
        self.thirdPageControl.isHidden = true
    
    }
    
    @IBAction func nextVCBtnPressed(_ sender: Any) {
        
        self.firstView.isHidden = false
        self.seconedView.isHidden = true
        self.seconedPageControl.isHidden = false
        self.thirdPageControl.isHidden = true
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func closeLanguageDropDownMenu (){
        UIView.animate(withDuration: 0.3) {
            self.languageBtns.forEach { (button) in
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    func closeCityDropDownMenu (){
        UIView.animate(withDuration: 0.3) {
            self.cityBtns.forEach { (b3) in
                b3.isHidden = !b3.isHidden
                self.view.layoutIfNeeded()
            }
            
        }
        
    }
    
    func closeDistinctDrop(){
        UIView.animate(withDuration: 0.3) {
            self.distinctsBtns.forEach { (xx) in
                xx.isHidden = !xx.isHidden
                self.view.layoutIfNeeded()
            }
        }
        
    }

}
