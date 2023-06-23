//
//  BasketVC.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/23.
//

import UIKit

struct BasketList {
    let imageURL: String
    let title: String
    let engilishTitle: String
    let options: String
    let cost: String
}

class BasketVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var resultView: UIView!
    
    let menuArray = [BasketList(imageURL: "https://images.unsplash.com/photo-1602351447937-745cb720612f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=986&q=80",
                                title: "상큼한 레몬 케이크",
                                engilishTitle: "Lemon Cream Cake",
                                options: "상큼한 레몬 케이크",
                                cost: "6800원"),
                     BasketList(imageURL: "https://images.unsplash.com/photo-1602351447937-745cb720612f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=986&q=80",
                                title: "아이스 카페 아메리카노",
                                engilishTitle: "Iced Caffe Americano",
                                options: "Iced | Grande | 개인컵",
                                cost: "5000원"),
                     BasketList(imageURL: "https://images.unsplash.com/photo-1602351447937-745cb720612f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=986&q=80",
                                title: "따뜻한 카페 아메리카노",
                                engilishTitle: "Hot Caffe Americano",
                                options: "Hot | Grande | 개인컵",
                                cost: "4500원"),
                     BasketList(imageURL: "https://images.unsplash.com/photo-1602351447937-745cb720612f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=986&q=80",
                                title: "따뜻한 카페 아메리카노",
                                engilishTitle: "Hot Caffe Americano",
                                options: "Hot | Grande | 개인컵",
                                cost: "4500원")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "장바구니"
        
        basketTableView.dataSource = self
        basketTableView.delegate = self
        
        resultView.backgroundColor = UIColor.white
        resultView.layer.shadowColor = UIColor.black.cgColor
        resultView.layer.shadowOpacity = 0.1
        resultView.layer.shadowOffset = CGSize(width: 2, height: 2)
        resultView.layer.shadowRadius = 16
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = basketTableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketTableViewCell
        
        cell.menuTitle.text = menuArray[indexPath.row].title
        cell.menuEnglishTitle.text = menuArray[indexPath.row].engilishTitle
        cell.options.text = menuArray[indexPath.row].options
        cell.menuCost.text = menuArray[indexPath.row].cost
        
        if let url = URL(string: menuArray[indexPath.row].imageURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("장바구니 이미지 다운로드 에러: \(error.localizedDescription)")
                    return
                }

                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        // 이미지를 받아와서 화면에 보여줄 작업을 수행합니다.
                        // 예: UIImageView에 이미지 설정
                        cell.menuImage.image = image
                    }
                }
            }.resume()
        }
        
        cell.menuImage.clipsToBounds = true
        cell.menuImage.layer.cornerRadius = 50
    
        return cell
    }
}
