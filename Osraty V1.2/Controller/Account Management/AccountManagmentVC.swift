//
//  ContainerVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit
import FTIndicator

class AccountManagmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var accManagTV: UITableView!
    
    var accTableView  = [String]()
    var iconlist  =  ["one","two","three","four","five","six","seven","eight"]
    var isSubViewOpen = false
    var isTVOpen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        accManagTV.delegate = self
        accManagTV.dataSource = self
        accManagTV.register(UINib(nibName: "accManagementCell", bundle: nil) , forCellReuseIdentifier: "cell")
        
   
        self.title = "حسابي"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! accManagementCell
        accTableView = ["الاشعارات","اتصل بنا","من نحن","الشروط و الاحكام","قائمة الاسعار","الحساب الشخصي","سجل المحادثات","تسجيل الخروج"]
        cell.cellName.text = accTableView[indexPath.row]
        cell.cellIcon.image = UIImage(named: iconlist[indexPath.row])

        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {



        switch indexPath.row {
        case 0: showNotificationVC()
        case 1: showCallUsVC()
        case 2: showWhoUsVC()
        case 3: showTermsAndConditionsVC()
        case 4: showListPricesVC()
        case 5: showProfile()
        case 6: showConvHistory()
        case 7: logOutBtnPressed()
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }





     func showNotificationVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotifictionsVC") as? NotifictionsVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }


     func showCallUsVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallUsVC") as? CallUsVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }


     func showWhoUsVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhoUsVC") as? WhoUsVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }


     func showTermsAndConditionsVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionsVC") as? TermsAndConditionsVC
        self.navigationController?.pushViewController(vc!, animated: true)

    }


     func showListPricesVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListPricesVC") as? ListPricesVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }



     func showProfile(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }

     func showConvHistory(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ConversationsHistoryVC") as? ConversationsHistoryVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }


     func logOutBtnPressed(){
        
        FTIndicator.showProgress(withMessage: "جاري تسجيل الخروج", userInteractionEnable: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            FTIndicator.dismissProgress()
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }

}







