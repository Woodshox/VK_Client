//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Woodshox on 09.08.21.
//

import UIKit

class FriendsViewController: UIViewController {

  @IBOutlet var friendsTableView: UITableView!
    //MARK: - Properties
        // indentifier
        private let cellID = "FriendsTableViewCell"
        //Friends Array
        var friends = [User(userName: "Moni", userImage: UIImage(named: "2_1")),
                      User(userName: "Alex", userImage: UIImage(named: "1_2")),
                      User(userName: "Mama", userImage: UIImage(named: "1_3")),
                      User(userName: "Oma", userImage: UIImage(named: "4"))]
    
    
    // добавление новых элементов в таблицу и проверка если такой элемент уже есть в таблице, он не будет добавлен
    @IBAction func goBackFromAnotherScreen(with segue: UIStoryboardSegue) {
        guard let anotherVC = segue.source as? AnotherFriendsViewController, let indexPath = anotherVC.tableView.indexPathForSelectedRow else { return }
        
        let newUser = anotherVC.friends[indexPath.row]
        
        guard !friends.contains(where: { User ->Bool in
            User.userName == newUser.userName 
            
        }) else { return }
            
        
        friends.append(newUser)
        friendsTableView.reloadData()
        }
     
    }

// количество секций в таблице
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    // инициализация ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        cell.friendsCellName?.text = friends[indexPath.row].userName
        cell.friendsCellImage?.image = friends[indexPath.row].userImage
        
        return cell
    }
//расстояние между секциями таблицы
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
// удаление по свайпу
extension FriendsViewController: UITableViewDelegate {
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

