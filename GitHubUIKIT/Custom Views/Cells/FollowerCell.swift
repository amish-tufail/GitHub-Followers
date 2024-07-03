 //
//  FollowerCell.swift
//  GitHubUIKIT
//
//  Created by Amish on 02/07/2024.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAvatarImage()
        configureUsernameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FollowerCell {
    
    private func configureAvatarImage() {
        let padding: CGFloat = 8.0
        addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    private func configureUsernameLabel() {
        addSubview((userNameLabel))
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12.0),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 8.0),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20.0)
            
        ])
    }
}

extension FollowerCell {
    func set(follower: Follower) {
        userNameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
}
