//
//  ContainerVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    @IBOutlet weak var currentOrderBtn: UIButton!
    @IBOutlet weak var lastOrderBtn: UIButton!
    @IBOutlet weak var ConstrsintForLastOrders: NSLayoutConstraint!
    @IBOutlet weak var ConstrsintForCurrentOrders: NSLayoutConstraint!
    
    var isLastOrdersOpen = false
    var iscurrentOrderOpen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "الطلبات"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLastOrdersVC), name: NSNotification.Name("showLastOrdersVC"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showCurrentOrdersVC), name: NSNotification.Name("showCurrentOrdersVC"), object: nil)
        
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
                currentOrderBtn.isEnabled = true
                lastOrderBtn.isEnabled = false
                
                NotificationCenter.default.post(name: NSNotification.Name("showLastOrdersVC"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showCurrentOrdersVC"), object: nil)
                lastOrderBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
                currentOrderBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
            
            case . left:
                currentOrderBtn.isEnabled = false
                lastOrderBtn.isEnabled = true
                
                NotificationCenter.default.post(name: NSNotification.Name("showLastOrdersVC"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showCurrentOrdersVC"), object: nil)
                currentOrderBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
                lastOrderBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
                
            default:
                break
            }
        }
    }
    
    
    @IBAction func currentOrdersBtnPressed(_ sender: Any) {
       currentOrderBtn.isEnabled = false
       lastOrderBtn.isEnabled = true
        
        NotificationCenter.default.post(name: NSNotification.Name("showLastOrdersVC"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showCurrentOrdersVC"), object: nil)
        currentOrderBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
        lastOrderBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
    }
    
    @IBAction func lastOrdersBtnPressed(_ sender: Any) {
        currentOrderBtn.isEnabled = true
        lastOrderBtn.isEnabled = false
        NotificationCenter.default.post(name: NSNotification.Name("showLastOrdersVC"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showCurrentOrdersVC"), object: nil)
        lastOrderBtn.setTitleColor(UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1), for: .normal)
        currentOrderBtn.setTitleColor(UIColor(red:53/255, green:47/255, blue:65/255, alpha: 1), for: .normal)
    }
    
   @objc func showLastOrdersVC() {
    if isLastOrdersOpen{
        isLastOrdersOpen = false
        ConstrsintForLastOrders.constant = -414
    }
    else {
        isLastOrdersOpen = true
        ConstrsintForLastOrders.constant = 0
    }
    UIView.animate(withDuration: 0.3) {
        self.view.layoutIfNeeded()
    }
    }
  
    @objc func showCurrentOrdersVC() {
        if iscurrentOrderOpen{
            iscurrentOrderOpen = false
            ConstrsintForCurrentOrders.constant = 414
        }
        else {
            iscurrentOrderOpen = true
            ConstrsintForCurrentOrders.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
        
    }
    
 


