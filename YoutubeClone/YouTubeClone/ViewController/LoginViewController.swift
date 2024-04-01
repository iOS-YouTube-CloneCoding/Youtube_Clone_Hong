//
//  LoginViewController.swift
//  YouTubeClone
//
//  Created by yujaehong on 3/25/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginInfoStackView = LoginInfoStackView()
    
    //  let logoImageView = UIImageView(image: UIImage(named: "GoogleLogo"))
    // 이미지 width, height 설정.. 이미지는 비율중요
    // lazy var에 대해... (stackView에서는 안됨..?)
    
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
        label.numberOfLines = 0 // 여러 줄 표시를 위해 설정
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
        
        // 백그라운드 컬러 안주면 검정색 화면뜸.. why???
        view.backgroundColor = .white
        setupUI()
        
        makeAccountButton.addTarget(self, action: #selector(makeAccountButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if isAllFieldsFilled {
                nextButton.backgroundColor = .systemBlue
                nextButton.isEnabled = true
            } else {
                nextButton.backgroundColor = .gray
                nextButton.isEnabled = false
            }
    }
    
    private var isAllFieldsFilled: Bool {
        return loginInfoStackView.isAllFieldsFilled
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func makeAccountButtonTapped() {
        print(#function)
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func nextButtonTapped() {
        print(#function)
        guard let name = loginInfoStackView.nameTextField.text, !name.isEmpty else { return }
            
        let signUpSuccessVC = LoginSuccessViewController(name: name)
        let navigationController = UINavigationController(rootViewController: signUpSuccessVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    private func setupUI() {
        // ⭐️ 고차함수가 너무 많아지면 연산이 많아져서 안좋을수있음.. 주의
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

// NSLayoutConstraint 익숙해지면 -> snapkit 사용해보기

