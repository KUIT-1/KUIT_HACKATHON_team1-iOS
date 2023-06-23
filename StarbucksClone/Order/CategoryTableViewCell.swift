//
//  CategoryTableViewCell.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitleKor: UILabel!
    @IBOutlet weak var categoryTitleEng: UILabel!
    
//    weak var delegate: OrderVC?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("TableViewCell Tapped / categoryTitleKor is " + categoryTitleKor.text!)
        
//        self.delegate?.pushMenuListView(categoryTitle: categoryTitleKor.text!)
    }

}
