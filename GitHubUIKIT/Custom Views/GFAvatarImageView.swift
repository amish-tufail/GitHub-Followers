//
//  GFAvatarImageView.swift
//  GitHubUIKIT
//
//  Created by Amish on 02/07/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    private let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10.0
        layer.cornerCurve = .continuous
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
