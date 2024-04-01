    // 버튼으로 바꿔야함..
    private let passwordCheckboxImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "square"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
        passwordCheckboxImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(passwordCheckboxTapped)))
    @objc private func textFieldDidChange(_ textField: UITextField) {
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
    @objc func passwordCheckboxTapped() {
        let isChecked = passwordCheckboxImageView.image == UIImage(systemName: "square")
        passwordCheckboxImageView.image = isChecked ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        passwordCheckboxImageView.tintColor = isChecked ? .systemBlue : .gray
        
        loginInfoStackView.passwordTextField.isSecureTextEntry = !isChecked
    }
