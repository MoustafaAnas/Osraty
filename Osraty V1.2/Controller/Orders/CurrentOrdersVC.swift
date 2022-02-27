//
//  CurrentOrdersVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class CurrentOrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var currentOrdersList: UITableView!
    
    var currentOrdersArray  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "الطلبات الحاليه"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
       currentOrdersList.register(UINib(nibName: "CurrentOrdersListCell", bundle: nil) , forCellReuseIdentifier: "cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showOrderDetails), name: NSNotification.Name("showOrderDetails"), object: nil) 
    }
   
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrentOrdersListCell
        currentOrdersArray = ["First","Seconed"]
        cell.constructionName.text = currentOrdersArray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(125)
    }
    
    @objc func showOrderDetails(){
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsVC") as? OrderDetailsVC
            self.navigationController?.pushViewController(vc!, animated: true)
    }

}
