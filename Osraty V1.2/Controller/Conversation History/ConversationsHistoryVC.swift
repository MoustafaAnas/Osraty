//
//  ConversationsHistoryVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class ConversationsHistoryVC: UIViewController {
    
    @IBOutlet weak var ConstrsintForCustomerChat: NSLayoutConstraint!
    @IBOutlet weak var ConstrsintForConstructionChat: NSLayoutConstraint!
    @IBOutlet weak var constructionChatBtn: UIButton!
    @IBOutlet weak var customerChatBtn: UIButton!
    
    
    var isCustomerChatOpen = false
    var isConstructonChatOpen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.title = "تاريخ المحادثات"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        NotificationCenter.default.addObserver(self, selector: #selector(showCustomerChatVC), name: NSNotification.Name("showCustomerChatVC"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showConstructonChatVC), name: NSNotification.Name("showConstructonChatVC"), object: nil)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(Sender:)))
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(Sender:)))
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    }

    
    @objc func handleSwipe(Sender: UISwipeGestureRecognizer) {
        
        if Sender.state == .ended {
            switch Sender.direction {
            case .right:
            
                constructionChatBtn.isEnabled = true
                customerChatBtn.isEnabled = false
                
                NotificationCenter.default.post(name: NSNotification.Name("showCustomerChatVC"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showConstructonChatVC"), object: nil)
                customerChatBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
                constructionChatBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
                
                
            case . left:
               
                constructionChatBtn.isEnabled = false
                customerChatBtn.isEnabled = true
                
                NotificationCenter.default.post(name: NSNotification.Name("showCustomerChatVC"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showConstructonChatVC"), object: nil)
                constructionChatBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
                customerChatBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
                
                
            default:
                break
            }
        }
    }
 
    
    @IBAction func constructionChatBtnPressed(_ sender: Any) {
        
        constructionChatBtn.isEnabled = false
        customerChatBtn.isEnabled = true
        
        NotificationCenter.default.post(name: NSNotification.Name("showCustomerChatVC"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showConstructonChatVC"), object: nil)
        constructionChatBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
        customerChatBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
    }
    
    @IBAction func customerChatBtnPressed(_ sender: Any) {
        constructionChatBtn.isEnabled = true
        customerChatBtn.isEnabled = false
        
        NotificationCenter.default.post(name: NSNotification.Name("showCustomerChatVC"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showConstructonChatVC"), object: nil)
        customerChatBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
        constructionChatBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
    }
    
    @objc func showCustomerChatVC() {
        if isCustomerChatOpen{
            isCustomerChatOpen = false
            ConstrsintForCustomerChat.constant = -414
        }
        else {
            isCustomerChatOpen = true
            ConstrsintForCustomerChat.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func showConstructonChatVC() {
        if isConstructonChatOpen{
            isConstructonChatOpen = false
            ConstrsintForConstructionChat.constant = 414
        }
        else {
            isConstructonChatOpen = true
            ConstrsintForConstructionChat.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
