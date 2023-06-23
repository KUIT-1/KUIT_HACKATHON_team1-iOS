//
//  SearchVC.swift
//  StarbucksClone
//
//  Created by YoonSub Lim on 2023/06/23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!

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
        
        // Text 없을 때는 무반응
        if searchTextField.text != ""{
            print(searchTextField.text)
            // 1. 최근 검색어 로컬DB 저장
            // 2. 현재 검색창 dismiss
            // 3. ## 검색 API 호출
            // 4. 결과 페이지 띄우기
            
        }
        
        return true
    }
    
}
