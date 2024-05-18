//
//  YouTuberIconsCollectionView.swift
//  youtubeSubsTab
//
//  Created by yujaehong on 5/7/24.
//

import UIKit

class ChannelCollectionView: UICollectionView {
    
    // MARK: - Properties
    
    private let channel = ChannelData()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero, collectionViewLayout: ChannelCollectionView.createLayout())
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private static func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 72, height: 104)
        return layout
    }
    
    private func configureCollectionView() {
        backgroundColor = .systemBackground
        showsHorizontalScrollIndicator = false
        register(ChannelCollectionViewCell.self, forCellWithReuseIdentifier: "ChannelCVC")
        dataSource = self
    }
    
}

// MARK: - UICollectionViewDataSource

extension ChannelCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCVC", for: indexPath) as! ChannelCollectionViewCell
        cell.setData(image: channel.list[indexPath.row].makeIamge(), name: channel.list[indexPath.row].name)
        return cell
    }
}
