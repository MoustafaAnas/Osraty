//
//  conversationChatVC.swift
//  Osraty
//
//  Created by NEW on 9/8/19.
//  Copyright © 2019 Anas. All rights reserved.
//

import UIKit

class constructionChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var constructionChatTV: UITableView!
    
    var constructionChatList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "المنشأت"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "عودة"
        constructionChatTV.register(UINib(nibName: "ConstructionChatCell", bundle: nil) , forCellReuseIdentifier: "cell")
        
    }
    

  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConstructionChatCell
        constructionChatList = ["first user","seconed user","third user"]
        cell.userName.text = constructionChatList[indexPath.row]
        
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
