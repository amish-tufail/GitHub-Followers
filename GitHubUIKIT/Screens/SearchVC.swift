//
//  SearchVC.swift
//  GitHubUIKIT
//
//  Created by Amish on 10/06/2024.
//

// For Constraint, there must be 4 constraint, defining x and y positon and height and width
// For Trailing and Bottom, we use negative value for constant

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionButton = GFButton(title: "Get Followers", backgroundColor: .systemGreen)
    
    var isUsernameEntered: Bool {
        return !userNameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension SearchVC {
    func configureLogoImageView() {
        logoImageView.image = UIImage(named: "gh-logo")!
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200.0),
            logoImageView.widthAnchor.constraint(equalToConstant: 200.0)
        ])
    }
    
    func configureTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48.0),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        // Think of it like button action
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside) // Whenever we tap this button, we call this function pushFollowerListVC
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50.0),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}

extension SearchVC {
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Pressed")
        return true
    }
}

extension SearchVC {
    @objc
    func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😄.", buttonTitle: "Ok")
            return
        }
        let followerListVC = FollowersListVC()
        followerListVC.userName = userNameTextField.text
        followerListVC.title = userNameTextField.text
        // To push VC in NC
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}


