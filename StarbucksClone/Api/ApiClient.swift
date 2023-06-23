//
//  ApiClient.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/23.
//

import Foundation
import Alamofire


class ApiClient: ObservableObject {
    let baseUrl = "https://136f-2001-e60-901c-eec-e0-2d4d-40f0-6ccd.jp.ngrok.io"
    
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
                print(response)
                var menuArray: [RecommendMenu] = []
                for menu in response.recommendMenuDtos {
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
    
    func getCategory(completion: @escaping ([Category]) -> Void) {
        let url = "\(baseUrl)/menu/mainCategory?id=1" // 1: 음료 2: 상품 3: MD ...
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: GetCategory.self) { response in
            switch response.result {
            case .success(let response):
                var categoryArray: [Category] = []
                for data in response.subCategoryList {
                    let id = data.id
                    let ImgUrl = data.ImgUrl
                    let TitleKor = data.TitleKor
                    let TitleEng = data.TitleEng
                    
                    categoryArray.append(Category(id: id,
                                                  ImgUrl: ImgUrl,
                                                  TitleKor: TitleKor,
                                                  TitleEng: TitleEng))
                }
                completion(categoryArray)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMenu(categoryId: Int, completion: @escaping ([Menu]) -> Void) {
        
        /// TODO
        let url = "\(baseUrl)/menu/subCategory?id=\(categoryId)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: GetMenu.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
                var menuArray: [Menu] = []
                for menu in response.menuList {
                    let imageURL = menu.ImgUrl
                    let titleKor = menu.TitleKor
                    let titleEng = menu.TitleEng
                    let price = menu.Price
                    
                    menuArray.append(Menu(ImgUrl: imageURL, TitleKor: titleKor, TitleEng: titleEng, Price: price))
                }
                completion(menuArray)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSearchedMenu(searchText: String, completion: @escaping ([Menu]) -> Void) {
        
        /// TODO
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        // URL에 검색어를 포함한 쿼리 스트링 생성
        if let encodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "\(baseUrl)/menu?name=\(encodedSearchText)") {
            // Alamofire를 사용하여 요청 전송
            AF.request(url,
                       method: .get,
                       encoding: JSONEncoding.default,
                       headers: headers)
            .responseDecodable(of: GetSearchedMenuList.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    var menuArray: [Menu] = []
                    for menu in response.menuList {
                        let imageURL = menu.ImgUrl
                        let titleKor = menu.TitleKor
                        let titleEng = menu.TitleEng
                        let price = menu.Price
                        
                        menuArray.append(Menu(ImgUrl: imageURL, TitleKor: titleKor, TitleEng: titleEng, Price: price))
                    }
                    completion(menuArray)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    
}
