//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Woodshox on 01.07.21.
//

import UIKit

class FriendsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifierUniversalTableCell = "reuseIdentifierUniversalTableCell"
    
    var freindsArray = [User]()
    
    func cofigure(userArray: [User]) {
        self.freindsArray = userArray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "UniversalTableCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    

}
 
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableCell, for: indexPath) as? UniversalTableCell else {return UITableViewCell()}
        
        
        cell.configure(title: "QQQQQQQQQQ", image: UIImage(named: "VK.com-logo.svg"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
