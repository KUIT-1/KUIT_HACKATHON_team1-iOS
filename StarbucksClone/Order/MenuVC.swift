//
//  MenuVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class MenuVC: UIViewController {

    var categoryName: String?
    var categoryId: Int?
    var menus: [Menu] = []
    
    @IBOutlet weak var menuListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = categoryName

        menuListTableView.dataSource = self
        menuListTableView.delegate = self
        menuListTableView.rowHeight = 120
        
        // TableView에 Cell 등록
        let nibName = UINib(nibName: "MenuCell", bundle: nil)
        menuListTableView.register(nibName, forCellReuseIdentifier: "MenuCell")
        
        // Menu 리스트 Get API 호출
        ApiClient().getMenu(categoryId: self.categoryId!) { menuArr in
            self.menus = menuArr
            self.menuListTableView.reloadData()
        }
        
    }

}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    // TableView item 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    // TableView Cell의 Object
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = menuListTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        let url = URL(string: menus[indexPath.row].ImgUrl)
        cell.menuImage.load(url: url!)
        cell.menuTitleKor.text = menus[indexPath.row].TitleKor
        cell.menuTitleEng.text = menus[indexPath.row].TitleEng
        cell.menuPrice.text = String(menus[indexPath.row].Price) + " 원"
        
        cell.menuImage.layer.cornerRadius = 50
        
        return cell
        
    }
    
    // select 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "Detail")

        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}

