//
//  ViewController.swift
//  ch03ImageView
//
//  Created by 김규리 on 2022/01/14.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false // 확대 여부
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imageView.image =  imgOn // imageView에 켜진 전구 이미지 부착
        
    }

    // 확대 버튼 클릭 시 동작하는 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale: CGFloat = 2.0 // 2배로 확대
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom) { // true 상태라면
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else { // false 축소 상태
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight) // 이미지 크기 변경
        isZoom = !isZoom // 확대,축소 여부 뒤집기
    }
    
    // 스위치 클릭 시 동작하는 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if (sender.isOn) { // 스위치가 켜지면
            imageView.image =  imgOn
        }
        else { // 꺼지면
            imageView.image =  imgOff
        }
        
    }
    
}

