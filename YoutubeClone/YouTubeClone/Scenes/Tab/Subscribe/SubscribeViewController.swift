//
//  SubscribeViewController.swift
//  YouTubeClone
//
//  Created by yujaehong on 4/15/24.
//

import UIKit

class SubscribeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let video = VideoData()
    private let channel = ChannelData()
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupNavigationBarItems()
        configureTableView()
    }
    
    // MARK: - Methods
    
    private func setupNavigationBarItems() {
        setupLeftNavigationItem()
        setupRightNavigationItems()
    }
    private func setupLeftNavigationItem() {
        let logoImage = UIImage(named: "YouTubeLogo")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        let logoItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = logoItem
    }
    
    private func setupRightNavigationItems() {
        let windowSharingButton = UIBarButtonItem(image: UIImage(named: "windowSharingIcon"), style: .plain, target: self, action: #selector(windowSharingButtonTapped))
        let notificationButton = UIBarButtonItem(image: UIImage(named: "NotificationIcon"), style: .plain, target: self, action: #selector(notificationButtonTapped))
        let searchButton = UIBarButtonItem(image: UIImage(named: "SearchIcon"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItems = [searchButton, notificationButton, windowSharingButton]
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ChannelTableViewCell.self, forCellReuseIdentifier: "ChannelTVC")
        tableView.register(TabButtonTableViewCell.self, forCellReuseIdentifier: "TabButtonCell")
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "VideoCell")
        
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // MARK: - @objc
    
    @objc func windowSharingButtonTapped() {
        print(#function)
    }
    
    @objc func notificationButtonTapped() {
        print(#function)
    }
    
    @objc func searchButtonTapped() {
        print(#function)
    }
}

// MARK: - UITableViewDataSource

extension SubscribeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        case 2:
            return video.list.count
        default:
            fatalError("Unexpected section \(section)")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelTVC", for: indexPath) as! ChannelTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TabButtonCell", for: indexPath) as! TabButtonTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
            cell.setData(thumb: video.list[indexPath.row].makeImage(),
                         profile: video.list[indexPath.row].makeprofileImage(), title: video.list[indexPath.row].title, sub: video.list[indexPath.row].sub)
            return cell
        default:
            fatalError("Unexpected section \(indexPath.section)")
        }
    }
}

// MARK: - UITableViewDelegate

extension SubscribeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 104
        case 1:
            return 48
        case 2:
            return 306
        default:
            return UITableView.automaticDimension
        }
    }
}

