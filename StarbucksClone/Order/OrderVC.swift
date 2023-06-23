//
//  OrderVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class OrderVC: UIViewController, pushNextView, UITableViewDelegate {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var Categories: [Category] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Order"
        
        // Do any additional setup after loading the view.
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        // ## API 호출 및 데이터 받아오기 ?
        // Json -> Category Struct 변환
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀", TitleEng: "eng title"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀1", TitleEng: "eng title1"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀2", TitleEng: "eng title2"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀3", TitleEng: "eng title3"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀4", TitleEng: "eng title4"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀5", TitleEng: "eng title5"))
        Categories.append(Category(ImgUrl: "https://picsum.photos/85", TitleKor: "코리안 타이틀6", TitleEng: "eng title6"))
        
    }
    
    @IBAction func searchBtnTap(_ sender: Any) {
        print("Search Button Tapped")
        
        // 검색 화면 전환
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        if let searchVC = storyboard.instantiateViewController(withIdentifier: "Search") as? SearchVC {
            searchVC.delegate = self
            searchVC.modalPresentationStyle = .fullScreen  // 전체 화면으로 표시
            present(searchVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func basketBtnTap(_ sender: Any) {
        
        print("Search Button Tapped")
        
        // 검색 화면 전환
        let storyboard = UIStoryboard(name: "Basket", bundle: nil)
        if let basketVC = storyboard.instantiateViewController(withIdentifier: "Basket") as? BasketVC {
            
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.pushViewController(basketVC, animated: true)
        }
        
    }
    
    
    func pushSearchResultView(searchText: String) {
        let storyboard = UIStoryboard(name: "SearchResult", bundle: nil)
        if let searchResultVC = storyboard.instantiateViewController(withIdentifier: "SearchResult") as? SearchResultVC {
            
            // 검색 결과 데이터 전달
            searchResultVC.searchText = searchText
            
            // OrderVC의 내비게이션 스택에 푸시
            print(self.navigationController)
            
            self.navigationController?.pushViewController(searchResultVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
//    func pushMenuListView(categoryTitle: String) {
//        print("## 1")
//        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC")
//        print("## " + (menuVC?.navigationController?.description)!)
//        print("## 2")
//        print("## " + self.description)
//        self.navigationController?.pushViewController(menuVC!, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        print("@## 1")
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC
//        print("@## " + (menuVC?.navigationController?.description)!)
        print("@## 2")
        print("@## " + self.description)
        menuVC?.categoryName = Categories[indexPath.row].TitleKor
//        self.tabBarController?.tabBar.isHidden = true
//        self.navigationController?.navigationBar.topItem?.title = Categories[indexPath.row].TitleKor
        
        self.navigationController?.pushViewController(menuVC!, animated: true)

    }
    
}

// Category Table View Cell Data 주입
extension OrderVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        // URL -> Image 추가 필요
        let url = URL(string: Categories[indexPath.row].ImgUrl)
        cell.categoryImage.load(url: url!)
        cell.categoryTitleKor.text = Categories[indexPath.row].TitleKor
        cell.categoryTitleEng.text = Categories[indexPath.row].TitleEng
        
        return cell
    }
}

struct Category {
    var ImgUrl: String
    var TitleKor: String
    var TitleEng: String
}

protocol pushNextView{
    func pushSearchResultView(searchText: String)
//    func pushMenuListView(categoryTitle: String)
}
