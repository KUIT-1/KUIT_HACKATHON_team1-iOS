//
//  ApiClient.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/23.
//

import Foundation
import Alamofire


class ApiClient {
    let baseUrl = ""
    
    func getRecommendMenu(completion: @escaping ([RecommendMenu]) -> Void) {
        let url = "\(baseUrl)/menu/recommend"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: GetRecommendMenu.self) { response in
                switch response.result {
                case .success(let response):
                    var menuArray: [RecommendMenu] = []
                    for menu in response.result {
                        let title = menu.title
                        let imageURL = menu.imageURL
                        menuArray.append(RecommendMenu(title: title, imageURL: imageURL))
                    }
                    completion(menuArray)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
