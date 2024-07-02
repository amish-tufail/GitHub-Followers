//
//  GFButton.swift
//  GitHubUIKIT
//
//  Created by Amish on 10/06/2024.
//

import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10.0
        layer.cornerCurve = .continuous
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    GFButton(title: "Get Followers", backgroundColor: .green)
}
