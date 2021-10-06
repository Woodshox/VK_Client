//
//  AnotherFriendsViewController.swift
//  VK_Client
//
//  Created by Woodshox on 09.08.21.
//

import UIKit

class AnotherFriendsViewController: UIViewController {
   
    //MARK: - OUTLETS
    @IBOutlet var tableView: UITableView!
    
    //MARK: - PROPERTIES
    let reuseId = "AnotherFriends"
    var friends = [User(userName: "Jack", userImage: UIImage(named: "2_1")),
                  User(userName: "Bob", userImage: UIImage(named: "1_2")),
                  User(userName: "Adam", userImage: UIImage(named: "1_3")),
                  User(userName: "Kate", userImage: UIImage(named: "3")),
                  User(userName: "Ahmed", userImage: UIImage(named: "4"))]
    
}

extension AnotherFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        cell.friendsCellName?.text = friends[indexPath.row].userName
        cell.friendsCellImage?.image = friends[indexPath.row].userImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
 // delete swipe
extension AnotherFriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedCity = friends[indexPath.row]
            friends.remove(at: indexPath.row)
            print(deletedCity.userName)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }

}
