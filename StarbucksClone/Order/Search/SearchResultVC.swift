//
//  SearchResultVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class SearchResultVC: UIViewController {

    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = searchText

    }
    

}
