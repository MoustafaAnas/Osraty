//
//  MainVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ordersList: UITableView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRate: UILabel!
    @IBOutlet weak var userCondition: UILabel!
    @IBOutlet weak var userConditionGraph: UISwitch!
    @IBOutlet weak var userConditionMsg: UILabel!
    @IBOutlet weak var pocketMoney: UILabel!
    @IBOutlet weak var currentWeakRevenue: UILabel!
    @IBOutlet weak var lastWeakRevnue: UILabel!
    
    var ordersTypeList  = [String]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "الرئيسيه"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        self.profilePicture.layer.cornerRadius = (self.profilePicture.frame.size.height)/2.0
        self.profilePicture.layer.masksToBounds = true
        
        ordersList.register(UINib(nibName: "OrdersTypeCell", bundle: nil) , forCellReuseIdentifier: "cell")
  
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrdersTypeCell
        ordersTypeList = ["الطلبات الحاليه","الطلبات السابقه"]
        cell.orderType.text = ordersTypeList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:goToCurrentOrders()
        case 1:goToLastOrders()
       
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
}

    func goToCurrentOrders(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrentOrdersVC") as? CurrentOrdersVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func goToLastOrders(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LastOrdersVC") as? LastOrdersVC
        self.navigationController?.pushViewController(vc!, animated: true)
  
    }
    
    
 
    
    
    }
