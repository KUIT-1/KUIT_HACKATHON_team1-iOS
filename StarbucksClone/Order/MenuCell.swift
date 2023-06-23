//
//  MenuCell.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/24.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitleKor: UILabel!
    @IBOutlet weak var menuTitleEng: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
