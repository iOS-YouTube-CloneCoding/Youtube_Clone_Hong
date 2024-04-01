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
        textField.addLeftPadding()
        return textField
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 휴대전화"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.addLeftPadding()
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 입력"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.addLeftPadding()
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
        alignment = .fill
        distribution = .fillEqually
        spacing = 17
        [nameTextField, idTextField, passwordTextField].forEach {
            addArrangedSubview($0)
        }
    }
    
}
