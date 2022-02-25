//
//  ViewController.swift
//  ch05PickerView
//
//  Created by 김규리 on 2022/01/17.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // 피커 뷰가 동작하는 데 필요한 변수 및 상수
    let MAX_ARRAY_NUM = 10 // 사용할 이미지 개수
    let PICKER_VIEW_COLUMN = 1 // 피커 뷰 열의 개수
    let PICKER_VIEW_HEIGHT:CGFloat = 80 // 피커뷰 높이 지정
    var imageArray = [UIImage?]() // UIImage 타입의 배열 선언
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", ] // 이미지 파일명 저장할 배열
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image) // imageArray에 이미지 추가
        }
        
        // 처음 화면에
        lblImageFileName.text = imageFileName[0] // 첫 번째 파일명 출력
        imageView.image = imageArray[0] //첫 번째 이미지 부착
    }
    
    // 델리게이트 메서드 추가
    // 피커 뷰에 표시되는 열의 개수를 넘겨주는 함수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 피커 뷰 높이를 정수 값으로 전달
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // imageFileName의 데이터의 개수(행의 개수)를 넘겨주는 함수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
//    // 피커 뷰 행 : imageFileName의 파일명을 리턴
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // 피커 뷰 행 : imageArray의 이미지를 리턴 (UIView 타입의 값으로 넘겨줌)
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row]) // imageView에 UIView 타입으로 저장
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150) // 이미지 뷰 프레임 크기
        
        return imageView // 이미지뷰 리턴
    }
    
    
    // lblImageFileName(Item)에 선택된 imageFileName 출력하는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row] // 선택된 파일명 출력
        imageView.image = imageArray[row] // 이미지 부착
    }


}

