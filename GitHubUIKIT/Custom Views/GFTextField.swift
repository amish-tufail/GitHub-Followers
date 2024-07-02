//
//  GFTextField.swift
//  GitHubUIKIT
//
//  Created by Amish on 10/06/2024.
//

import UIKit

class GFTextField: UITextField {
    
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
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        autocapitalizationType = .none
        returnKeyType = .go
        
        placeholder = "Enter a username"
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


