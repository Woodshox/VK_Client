//
//  AddNewGroupViewController.swift
//  VK_Client
//
//  Created by Woodshox on 17.08.21.
//

import UIKit

class AddNewGroupViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var addNewGroupsView: UITableView!
    
    //MARK: - Properties
    // indentifier
    private let cellIDAddNewGroups = "AddNewGroupViewController"
    var groups = [Group(groupName: "Group 7", groupImage: UIImage(named: "2gr")),
                Group(groupName: "Group 8", groupImage: UIImage(named: "3gr")),
                Group(groupName: "Group 9", groupImage: UIImage(named: "4gr")),
                Group(groupName: "Group 10", groupImage: UIImage(named: "5gr"))]

}

extension AddNewGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIDAddNewGroups, for: indexPath) as? GroupsTableViewCell else {
            fatalError("{ Message: Error in dequeue AddNewGroupViewController }")
        }
        cell.groupCellName?.text = groups[indexPath.row].groupName
        cell.groupCellImage?.image = groups[indexPath.row].groupImage
        return cell
    }
    
}

extension AddNewGroupViewController: UITableViewDelegate{
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

