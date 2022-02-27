//
//  customerChatVC.swift
//  Osraty
//
//  Created by NEW on 9/8/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class customerChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var customerChatTV: UITableView!
    
    var customerChatList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "العملاء"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
         customerChatTV.register(UINib(nibName: "CustomerChatCell", bundle: nil) , forCellReuseIdentifier: "cell")
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomerChatCell
        customerChatList = ["fourth user","fifth user","sixth user"]
        cell.userName.text = customerChatList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:goToChat()
        case 1:goToChat()
        case 2:goToChat()
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func goToChat(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
