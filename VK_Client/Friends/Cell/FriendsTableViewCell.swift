//
//  FriendsTableViewCell.swift
//  VK_Client
//
//  Created by Woodshox on 09.08.21.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet var friendsCellImage: UIImageView?
    @IBOutlet var backView: UIView!
    @IBOutlet var friendsCellName: UILabel?
    
    func setup() {
        friendsCellImage?.layer.cornerRadius = 30
        friendsCellImage?.contentMode = .scaleAspectFill
        friendsCellImage?.layer.masksToBounds = true
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



