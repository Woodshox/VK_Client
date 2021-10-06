//
//  GroupsViewController.swift
//  VK_Client
//
//  Created by Woodshox on 17.08.21.
//

import UIKit

class GroupsViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet var groupsTableView: UITableView!
    
    //MARK: - Properties
        // indentifier
    private let cellIDGroups = "GroupsViewController"
    var groups = [Group(groupName: "Group 1", groupImage: UIImage(named: "1gr")),
                Group(groupName: "Group 2", groupImage: UIImage(named: "2gr")),
                Group(groupName: "Group 3", groupImage: UIImage(named: "3gr")),
                Group(groupName: "Group 4", groupImage: UIImage(named: "4gr")),
                Group(groupName: "Group 5", groupImage: UIImage(named: "5gr"))]
    
    @IBAction func goBackFromAddNewGroup(with segue: UIStoryboardSegue) {
        guard let avalibleVC = segue.source as? AddNewGroupViewController,
              let indexPath = avalibleVC.addNewGroupsView.indexPathForSelectedRow else { return    }
        let newGroup = avalibleVC.groups[indexPath.row]
        
        guard !groups.contains(where: {Group -> Bool in
            Group.groupName == newGroup.groupName
        }) else { return }
        
        groups.append(newGroup)
        groupsTableView.reloadData()
        }

}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIDGroups, for: indexPath) as? GroupsTableViewCell else {
            fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        cell.groupCellName?.text = groups[indexPath.row].groupName
        cell.groupCellImage?.image = groups[indexPath.row].groupImage
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func adjustTableViewHeight() {
            var height = groupsTableView.contentSize.height
            let maxHeight = (groupsTableView.superview?.frame.size.height)! - self.groupsTableView.frame.origin.y

           if height > maxHeight {
               height = maxHeight
           }

        UIView.animate(withDuration: 0.5) {
               //Assuming 'tableViewHeightConstraint` is an IBOutlet from your storyboard/XIB
//                self.tableViewHeightConstraint.constant = height
//                self.tableView.setNeedsUpdateConstraints()
            }
        }
}

extension GroupsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedGroup = groups[indexPath.row]
            groups.remove(at: indexPath.row)
            print(deletedGroup.groupName)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
}
