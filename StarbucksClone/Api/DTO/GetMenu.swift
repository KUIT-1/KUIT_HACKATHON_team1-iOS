//
//  GetMenu.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/24.
//

import Foundation

struct GetMenu: Codable {
    let menuList: [Menu]
}

struct Menu: Codable{
    var ImgUrl: String
    var TitleKor: String
    var TitleEng: String
    var Price: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case ImgUrl = "image_url"
        case TitleKor = "name_kr"
        case TitleEng = "name_eng"
        case Price = "price"
    }
}
