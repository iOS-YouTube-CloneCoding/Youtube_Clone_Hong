        label.numberOfLines = 0 // 여러 줄 표시를 위해 설정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.textAlignment = .center
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
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
