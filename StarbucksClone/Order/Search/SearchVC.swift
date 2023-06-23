//
//  SearchVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    weak var delegate: OrderVC?

    @IBAction func cancelBtnTapped(_ sender: Any) {
        // Back to Order Storyboard
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTextField.delegate = self

        // 최근 검색어 유무에 따른 뷰 구성
        // 1. 최근 검색어 O
        // 최근 검색어 Load
        
        // 2. 최근 검색어 X
        // 최근 검색어가 없습니다. Label
        
    }
    
    // 전체 삭제
    
    // 선택 삭제
    
}

extension SearchVC: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Text가 비어 있으면 아무 작업도 하지 않음
        guard let searchText = searchTextField.text, !searchText.isEmpty else {
            return true
        }

        dismiss(animated: true) {
            self.delegate?.pushSearchResultView(searchText: searchText)
        }
        
        return true
    }

}
