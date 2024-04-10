//
//  SignUpSuccessView.swift
//  YouTubeClone
//
//  Created by yujaehong on 3/25/24.
//

import UIKit

final class LoginSuccessViewController: UIViewController {
    
    var name: String?
    
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        welcomLabel.text = "\(name)님\n환영합니다!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoImageView = UIImageView(image: UIImage(named: "Googlelogo"))
    
    // extension 활용해보기
    private let welcomLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.textAlignment = .center
        
        return label
    }()
    
    private let okButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.customBlueButtonColor()
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let loginWithDifferentAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("다른 계정으로 로그인하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.customBlueButtonColor(), for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        loginWithDifferentAccountButton.addTarget(self, action: #selector(loginWithDifferentAccountButtonTapped), for: .touchUpInside)
    }
    
    @objc func okButtonTapped() {
        print(#function)
    }
    
    @objc func loginWithDifferentAccountButtonTapped() {
        print(#function)
    }
    
    
    private func setupUI() {
        [logoImageView, welcomLabel, okButton, loginWithDifferentAccountButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 248),
            
            welcomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 23),
            
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.topAnchor.constraint(equalTo: welcomLabel.bottomAnchor, constant: 53),
            okButton.heightAnchor.constraint(equalToConstant: 42),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            loginWithDifferentAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginWithDifferentAccountButton.topAnchor.constraint(equalTo: okButton.bottomAnchor, constant: 23),
            loginWithDifferentAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            loginWithDifferentAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
    }
}
