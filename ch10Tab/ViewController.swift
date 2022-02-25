//
//  ViewController.swift
//  ch10Tab
//
//  Created by 김규리 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1 // 이미지뷰로 이동
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2 // 데이트 피커뷰로 이동
    }
}

