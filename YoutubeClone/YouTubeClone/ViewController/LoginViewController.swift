//
//  LoginViewController.swift
//  YouTubeClone
//
//  Created by yujaehong on 3/25/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginInfoStackView = LoginInfoStackView()
    
    private var isAllFieldsFilled: Bool = false {
        didSet {
            nextButton.backgroundColor = isAllFieldsFilled ? .customBlue : .lightGray
            nextButton.isEnabled = isAllFieldsFilled
        }
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Googlelogo"))
        imageView.contentMode = .scaleAspectFit //  이미지가 이미지 뷰에 맞게 비율을 유지하면서 확대 또는 축소되도록 ...?
        imageView.widthAnchor.constraint(equalToConstant: 118).isActive = true // ...?
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    private let headGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let detailGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "Youtube로 이동하여 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다. "
        label.numberOfLines = 0 
        label.font = UIFont.systemFont(ofSize: 14)
        label.setLineSpacing(lineSpacing: 5)
        label.textAlignment = .center
        return label
    }()
    
    private let makeAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("계정 만들기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 8
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
        setupButtonActions()
        setupTextFieldEditingChangedActions()
    }
    
    private func setupButtonActions() {
        makeAccountButton.addTarget(self, action: #selector(makeAccountButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupTextFieldEditingChangedActions() {
        [loginInfoStackView.nameTextField, loginInfoStackView.idTextField, loginInfoStackView.passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        isAllFieldsFilled = loginInfoStackView.isAllFieldsFilled
    }
    
    @objc func makeAccountButtonTapped() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func nextButtonTapped() {
        guard let name = loginInfoStackView.nameTextField.text, !name.isEmpty else { return }
        
        let signUpSuccessVC = LoginSuccessViewController(name: name)
        let navigationController = UINavigationController(rootViewController: signUpSuccessVC)
        present(navigationController, animated: true, completion: nil)
    }
}

extension LoginViewController {
    
    private func configureUI() {
        [logoImageView, loginInfoStackView, headGuideLabel,
         detailGuideLabel, makeAccountButton, nextButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 118),
            
            headGuideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headGuideLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 23),
            
            detailGuideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailGuideLabel.topAnchor.constraint(equalTo: headGuideLabel.bottomAnchor, constant: 14),
            
            loginInfoStackView.heightAnchor.constraint(equalToConstant: 178),
            loginInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            loginInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            loginInfoStackView.topAnchor.constraint(equalTo: detailGuideLabel.bottomAnchor, constant: 68),
            
            makeAccountButton.topAnchor.constraint(equalTo: loginInfoStackView.bottomAnchor, constant: 73),
            makeAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            makeAccountButton.widthAnchor.constraint(equalToConstant: 68),
            makeAccountButton.heightAnchor.constraint(equalToConstant: 22),
            
            nextButton.topAnchor.constraint(equalTo: loginInfoStackView.bottomAnchor, constant: 64),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            nextButton.widthAnchor.constraint(equalToConstant: 74),
            nextButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}


