//
//  GroupsTableViewCell.swift
//  VK_Client
//
//  Created by Woodshox on 17.08.21.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet var groupCellImage: UIImageView?
    @IBOutlet var groupCellName: UILabel?
    @IBOutlet var backView: UIView!
    
    func setup() {
        groupCellImage?.layer.cornerRadius = 30
        groupCellImage?.contentMode = .scaleAspectFill
        //groupCellImage?.layer.masksToBounds = true
        backView.layer.cornerRadius = 35
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 5, height: 5)
        backView.layer.shadowRadius = 5
        backView.layer.shadowOpacity = 0.5
      
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
}
