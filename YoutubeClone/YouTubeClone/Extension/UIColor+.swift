//
//  UIColor+.swift
//  YouTubeClone
//
//  Created by yujaehong on 4/2/24.
//

import UIKit

extension UIColor {
    /* static func 키워드는 해당 함수가 인스턴스화되지 않고 클래스 이름 자체로 호출될 수 있음을 나타냄.
     UIColor 클래스의 경우, 색을 나타내는 객체를 만들기 위해 인스턴스화할 필요가 없으므로
     static 함수를 사용하여 색상을 반환하는 것이 일반적
     */
    static func customBlueButtonColor() -> UIColor {
        return UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1.0)
    }
}
