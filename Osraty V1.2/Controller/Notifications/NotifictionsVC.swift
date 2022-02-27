//
//  NotifictionsVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class NotifictionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notificationsTV: UITableView!
    
    var notificationsList  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "التنبيهات"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        notificationsTV.register(UINib(nibName: "notificationCell", bundle: nil) , forCellReuseIdentifier: "cell")
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! notificationCell
        notificationsList = ["first notification","seconed notification","third notification"]
        cell.notificationLabel.text = notificationsList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
