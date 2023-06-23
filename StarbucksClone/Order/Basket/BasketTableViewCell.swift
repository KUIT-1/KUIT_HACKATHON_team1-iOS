//
//  BasketTableViewCell.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/23.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuEnglishTitle: UILabel!
    
    @IBOutlet weak var options: UILabel!
    @IBOutlet weak var menuCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
