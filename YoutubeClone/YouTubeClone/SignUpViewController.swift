    // 버튼으로 바꿔야함..
    private let passwordCheckboxImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "square"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
        passwordCheckboxImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(passwordCheckboxTapped)))
    @objc func passwordCheckboxTapped() {
        let isChecked = passwordCheckboxImageView.image == UIImage(systemName: "square")
        passwordCheckboxImageView.image = isChecked ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        passwordCheckboxImageView.tintColor = isChecked ? .systemBlue : .gray
        
        loginInfoStackView.passwordTextField.isSecureTextEntry = !isChecked
    }
