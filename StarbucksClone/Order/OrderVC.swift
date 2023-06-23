//
//  OrderVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class OrderVC: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    struct Category {
        var ImgUrl: String
        var TitleKor: String
        var TitleEng: String
    }
    
    var Categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Order"


        // Do any additional setup after loading the view.
        categoryTableView.dataSource = self
        
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
//        cell.categoryImage.image = Categories[indexPath.row].ImgUrl
        cell.categoryTitleKor.text = Categories[indexPath.row].TitleKor
        cell.categoryTitleEng.text = Categories[indexPath.row].TitleEng
        
        return cell
    }
    
    
}
