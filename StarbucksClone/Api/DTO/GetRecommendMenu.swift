//
//  GetRecommendMenu.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/24.
//

import Foundation

struct GetRecommendMenu: Codable {
    let recommendMenuDtos: [RecommendMenu]
}

struct RecommendMenu: Codable {
    let title: String
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case imageURL = "imageUrl"
    }
}
