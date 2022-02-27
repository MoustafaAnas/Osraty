//
//  WalletVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class WalletVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var currentMoneyAmount: UILabel!
    @IBOutlet weak var containerTwo: UIView!
    @IBOutlet weak var showOrderDetailsTV: UITableView!
    @IBOutlet var showOrderDetailsView: UIView!
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var totalCashTakenFromCustomer: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var osratyRevnue: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var redPoint: UIImageView!
    @IBOutlet weak var blurVE: UIVisualEffectView!
    @IBOutlet var creditCardView: UIView!
    
    var showOrderDetailsList  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurVE.alpha = 0.0
        
       self.title = "المحفظه"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        containerTwo.setGradientBackground(colorOne: (UIColor(red:54/255, green:81/255, blue:118/255, alpha: 1)), colorTwo: (UIColor(red:37/255, green:172/255, blue:161/255, alpha: 1)))
        
        showOrderDetailsTV.register(UINib(nibName: "showOrderDetailsCell", bundle: nil) , forCellReuseIdentifier: "cell")
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! showOrderDetailsCell
        showOrderDetailsList = ["first id","seconed id",]
        cell.orderID.text = showOrderDetailsList[indexPath.row]
        
        self.redPoint.layer.cornerRadius = (self.redPoint.frame.size.height)/2.0
        self.redPoint.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        switch indexPath.row {
        case 0:popupIn(popupName: showOrderDetailsView)
        case 1:popupIn(popupName: showOrderDetailsView)
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(66)
    }
    
    @IBAction func addToWalletCreditBtnPressed(_ sender: Any) {
        popupIn(popupName: creditCardView)
    }
    
    @IBAction func showDetailsBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsVC") as? OrderDetailsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        popupOut(popupName: showOrderDetailsView)
    }
    @IBAction func closePopup(_ sender: Any) {
        popupOut(popupName: showOrderDetailsView)
    }
    @IBAction func creditBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreditCardVC") as? CreditCardVC
        self.navigationController?.pushViewController(vc!, animated: true)
        popupOut(popupName: creditCardView)
    }
    
    @IBAction func closeCreitView(_ sender: Any) {
        popupOut(popupName: creditCardView)
    }
    
    func popupIn(popupName: UIView) {
        
        self.view.addSubview(popupName)
        popupName.center = self.view.center
        
        popupName.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupName.alpha = 0.0
        
        UIView.animate(withDuration: 0.4){
           self.blurVE.alpha = 0.40
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
    
}
