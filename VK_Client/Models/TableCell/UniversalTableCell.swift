//
//  UniversalTableCell.swift
//  VK_Client
//
//  Created by Woodshox on 01.07.21.
//

import UIKit

class UniversalTableCell: UITableViewCell {

    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setup() {
        avatarView.layer.cornerRadius = 25
        backView.layer.cornerRadius = 25
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 5, height: 5)
        backView.layer.shadowRadius = 5
        backView.layer.shadowOpacity = 0.5
      
    }
    
    func clearCell() {
        self.avatarView.image = nil
        self.titleLabel.text = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }

    func configure (title: String, image: UIImage?) {
        titleLabel.text = title
        avatarView.image = image
        
    }
    
}
