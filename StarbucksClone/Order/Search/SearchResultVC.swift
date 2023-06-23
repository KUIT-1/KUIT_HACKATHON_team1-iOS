//
//  SearchResultVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class SearchResultVC: UIViewController {

    @IBOutlet weak var menuListTableView: UITableView!
    
    var menus: [Menu] = []
    
    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = searchText
        menuListTableView.dataSource = self
        menuListTableView.delegate = self
        menuListTableView.rowHeight = 120
        
        menus.append(Menu(ImgUrl: "https://picsum.photos/100", TitleKor: "1코리안타이틀", TitleEng: "1EngTitle", Price: "11000"))
        menus.append(Menu(ImgUrl: "https://picsum.photos/100", TitleKor: "2코리안타이틀", TitleEng: "2EngTitle", Price: "10000"))
        menus.append(Menu(ImgUrl: "https://picsum.photos/100", TitleKor: "3코리안타이틀", TitleEng: "3EngTitle", Price: "200"))
        menus.append(Menu(ImgUrl: "https://picsum.photos/100", TitleKor: "4코리안타이틀", TitleEng: "4EngTitle", Price: "3000"))
        menus.append(Menu(ImgUrl: "https://picsum.photos/100", TitleKor: "5코리안타이틀", TitleEng: "5EngTitle", Price: "1230"))
        
        
        // TableView에 Cell 등록
        let nibName = UINib(nibName: "MenuCell", bundle: nil)
        menuListTableView.register(nibName, forCellReuseIdentifier: "MenuCell")
    }
    

}

struct Menu{
    var ImgUrl: String
    var TitleKor: String
    var TitleEng: String
    var Price: String
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    
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
        cell.menuPrice.text = menus[indexPath.row].Price + " 원"
        
        return cell
        
    }
}
