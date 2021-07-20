//
//  LoginViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let homeComponent: HomeComponentProtocol
    private let accountProvider: UserAccountProviderProtocol
    
    private let usernameTextfield: UITextField = {
        let tf = UITextField()
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 2
        tf.layer.masksToBounds = true
        return tf
    }()
    
    private let passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 2
        tf.layer.masksToBounds = true
        return tf
    }()
    
    private let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 2
        btn.layer.masksToBounds = true
        return btn
    }()
    
    init(
        homeComponent: HomeComponentProtocol,
        accountProvider: UserAccountProviderProtocol
    ) {
        self.homeComponent = homeComponent
        self.accountProvider = accountProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
}

fileprivate extension LoginViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(usernameTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            usernameTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            usernameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextfield.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 20),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextfield.heightAnchor.constraint(equalTo: button.heightAnchor),
            passwordTextfield.heightAnchor.constraint(equalTo: button.heightAnchor)
        ])
    }
    
    func configureUI() {
        usernameTextfield.placeholder = "username"
        passwordTextfield.placeholder = "password"
        if let account = try? accountProvider.loadAccount() {
            usernameTextfield.text = account.username
            button.setTitle("Login", for: .normal)
            button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        } else {
            button.setTitle("Register", for: .normal)
            button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        }
    }
    
    @objc func handleLogin() {
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
    }
    
    @objc func handleRegister() {
        guard let username = usernameTextfield.text else { return }
        guard let _ = passwordTextfield.text else { return }
        try! accountProvider.save(UserAccount(username: username, shouldShowTutorial: true))
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
    }
}
