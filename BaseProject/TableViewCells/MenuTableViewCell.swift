//
//  MenuTableViewCell.swift
//  SwiftBaseProject
//
//  Created by Navneet Singh on 15/02/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.cornerRadius = 2
        profileImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
