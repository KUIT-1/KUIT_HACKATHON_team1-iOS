//
//  HomeVC.swift
//  StarbucksClone
//
//  Created by 이안진 on 2023/06/23.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var LoginBoxView: UIView!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var BannerAD1: UIImageView!
    @IBOutlet weak var BannerAD2: UIImageView!
    @IBOutlet weak var BannerAD3: UIImageView!
    
    @IBOutlet weak var RecommendCollectionView: UICollectionView!
    
    var menuArray: [RecommendMenu] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginBoxView.backgroundColor = UIColor.white
        LoginBoxView.layer.shadowColor = UIColor.black.cgColor
        LoginBoxView.layer.shadowOpacity = 0.1
        LoginBoxView.layer.shadowOffset = CGSize(width: 2, height: 2)
        LoginBoxView.layer.shadowRadius = 16
        
        LoginButton.layer.borderWidth = 1.0
        LoginButton.layer.borderColor = UIColor(named: "MainGreen")?.cgColor
        LoginButton.layer.cornerRadius = 18
        
        BannerAD1.layer.cornerRadius = 8
        BannerAD2.layer.cornerRadius = 8
        BannerAD3.layer.cornerRadius = 8
        
        RecommendCollectionView.dataSource = self
        RecommendCollectionView.delegate = self
        RecommendCollectionView.isScrollEnabled = true
        
        ApiClient().getRecommendMenu { menuArr in
            self.menuArray = menuArr
            self.RecommendCollectionView.reloadData()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecommendCollectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! HomeRecommendMenyCollectionViewCell
        
        cell.menuTitle.text = menuArray[indexPath.row].title
//        cell.menuImage.image = UIImage(named: menuArray[indexPath.row].imageURL)
        if let url = URL(string: menuArray[indexPath.row].imageURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("이미지 다운로드 에러: \(error.localizedDescription)")
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
        cell.menuImage.layer.cornerRadius = 65
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 각 셀의 크기를 반환
        return CGSize(width: 130.0, height: 180.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        }
}
