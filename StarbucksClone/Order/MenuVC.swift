//
//  MenuVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var menuNavigationBar: UINavigationBar!
    var categoryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNavigationBar.topItem?.title = categoryName
        // Do any additional setup after loading the view.
//        self.tabBarController?.tabBar.isHidden = true
//        self.navigationController?.title = Categories[indexPath.row].TitleKor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
