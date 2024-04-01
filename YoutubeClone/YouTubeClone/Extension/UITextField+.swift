//
//  UITextField+.swift
//  YouTubeClone
//
//  Created by yujaehong on 4/2/24.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
