//
//  GetCategory.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/24.
//

import Foundation

struct GetCategory: Codable {
    let subCategoryList: [Category]
}

struct Category: Codable {
    var id: Int
    var ImgUrl: String
    var TitleKor: String
    var TitleEng: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case ImgUrl = "image_url"
        case TitleKor = "name_kr"
        case TitleEng = "name_eng"
    }
}
