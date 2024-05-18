//
//  VideoTableViewCell.swift
//  youtubeSubsTab
//
//  Created by yujaehong on 5/7/24.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let thumbNailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let profileImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemGray5
        button.contentMode = .scaleAspectFill
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button.layer.cornerRadius = 36 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    private let titleTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let subTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    private let kebabButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "kebab"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupAutoLayout()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        backgroundColor = .systemBackground
    }
    
    private func setupAutoLayout() {
        [thumbNailImageView, profileImageButton, titleTextLabel, subTextLabel, kebabButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            thumbNailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbNailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbNailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbNailImageView.heightAnchor.constraint(equalToConstant: 212),
            
            profileImageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            profileImageButton.topAnchor.constraint(equalTo: thumbNailImageView.bottomAnchor, constant: 12),
            
            titleTextLabel.leadingAnchor.constraint(equalTo: profileImageButton.trailingAnchor, constant: 11.83),
            titleTextLabel.topAnchor.constraint(equalTo: thumbNailImageView.bottomAnchor, constant: 12.02),
            titleTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45.17),
            
            subTextLabel.leadingAnchor.constraint(equalTo: profileImageButton.trailingAnchor, constant: 12),
            subTextLabel.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 5),
            
            kebabButton.leadingAnchor.constraint(equalTo: titleTextLabel.trailingAnchor, constant: 10),
            kebabButton.topAnchor.constraint(equalTo: thumbNailImageView.bottomAnchor, constant: 7),
            kebabButton.widthAnchor.constraint(equalToConstant: 26),
            kebabButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupTapGesture() {
        let contentViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(contentViewTapped))
        contentView.addGestureRecognizer(contentViewTapGesture)
        
        let channelImageButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(channelImageButtonTapped))
        profileImageButton.addGestureRecognizer(channelImageButtonTapGesture)
        
        let kebabButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(kebabButtonTapped))
        kebabButton.addGestureRecognizer(kebabButtonTapGesture)
    }
    
    func setData(thumb: UIImage?, profile: UIImageView?, title: String, sub: String) {
        thumbNailImageView.image = thumb
        // profileImageButton.imageView 대신 setImage 메소드를 사용해 이미지 설정
        if let profileImage = profile?.image { // UIImageView의 image 속성을 가져옵니다.
            profileImageButton.setImage(profileImage, for: .normal)
        }
        
        titleTextLabel.text = title
        subTextLabel.text = sub
    }
    
    // MARK: - @objc
    
    @objc private func contentViewTapped() {
        print(#function)
    }
    
    @objc private func channelImageButtonTapped() {
        print(#function)
    }
    
    @objc private func kebabButtonTapped() {
        print(#function)
    }
}

