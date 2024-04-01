//
//  loginInfoStackView.swift
//  YouTubeClone
//
//  Created by yujaehong on 3/25/24.
//

import UIKit

class LoginInfoStackView: UIStackView {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 휴대전화"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        // 패딩 -> 메서드 만들어서 사용 (계속사용되니까) UITextField 익스텐션에..
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 입력"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var isAllFieldsFilled: Bool {
        return !nameTextField.text!.isEmpty && !idTextField.text!.isEmpty && !passwordTextField.text!.isEmpty
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        axis = .vertical
        spacing = 17
        alignment = .fill
        distribution = .fillEqually
        addArrangedSubview(nameTextField)
        addArrangedSubview(idTextField)
        addArrangedSubview(passwordTextField)
    }
    
}
