//
//  LastOrdersVC.swift
//  Osraty
//
//  Created by NEW on 9/6/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class LastOrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lastOrdersList: UITableView!
    
    var lastOrdersArray  = [String]()
    var isNavBarOpen : ContainerVC?
    var isNavOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "الطلبات السابقه"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        
        lastOrdersList.register(UINib(nibName: "LastOrdersListCell", bundle: nil) , forCellReuseIdentifier: "cell")
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LastOrdersListCell
        lastOrdersArray = ["Third","Fourth","Fifth"]
        cell.constructionName.text = lastOrdersArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(125)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

}
