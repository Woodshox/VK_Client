//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Woodshox on 01.07.21.
//

import UIKit

class FriendsViewController: UIViewController {

    // MARK: -Outlets
    
    @IBOutlet var FriendsTableView: UITableView!
    
    // MARK: -Properties
    let cellID = "FriendsTableViewCell"
    
    // Array with Friends
    var freindsArray = [User(name: "ALEX", avatar: UIImage(named: "1_1")),
                        User(name: "Jane", avatar: UIImage(named: "1_2")),
                        User(name: "Monika", avatar: UIImage(named: "2_1"))]
    
    func cofigure(userArray: [User]) {
        self.freindsArray = userArray
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()

        self.FriendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
    }
}
 
                                                                    
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freindsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{Error in dequeue FriendsTableViewCell}")
    }
        
//        cell.avatarView.image = freindsArray[indexPath.row].avatar
//        cell.titleLabel.text = freindsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
  
           
}
