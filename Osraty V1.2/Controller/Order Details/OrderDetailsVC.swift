//
//  OrderDetailsVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class OrderDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var constructionPic: UIImageView!
    @IBOutlet weak var customerPic: UIImageView!
    @IBOutlet weak var constructionNumber: UILabel!
    @IBOutlet weak var constructionAddres: UITextView!
    @IBOutlet weak var customerNumber: UILabel!
    @IBOutlet weak var customerAddress: UITextView!
    @IBOutlet weak var orderCondition: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var leftDistance: UILabel!
    @IBOutlet weak var timeOrderAsked: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderDetailsTV: UITableView!
    @IBOutlet var orderDetailsView: UIView!
    @IBOutlet weak var blurVE: UIVisualEffectView!
    
    var orderDetailsList = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blurVE.alpha = 0.0
        
        self.title = "تفاصيل الطلب"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        self.constructionPic.layer.cornerRadius = (self.constructionPic.frame.size.height)/2.0
        self.constructionPic.layer.masksToBounds = true
        
        self.customerPic.layer.cornerRadius = (self.customerPic.frame.size.height)/2.0
        self.customerPic.layer.masksToBounds = true
        
        orderDetailsTV.register(UINib(nibName: "orderDetailsCell", bundle: nil) , forCellReuseIdentifier: "cell")
    
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! orderDetailsCell
        orderDetailsList = ["first order","seconed order","third order"]
        cell.nameOfOrder.text = orderDetailsList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBAction func startChatWithConstructionBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "constructionChatVC") as? constructionChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func startChatWithCustomerBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "customerChatVC") as? customerChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func orderContentBtnPressed(_ sender: Any) {
        popupIn(popupName: orderDetailsView)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        popupOut(popupName: orderDetailsView)
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
