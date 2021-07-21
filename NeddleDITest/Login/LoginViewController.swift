//
//  LoginViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
    func configureUsernameTextField(placeholder: String?, text: String?)
    func configurePasswordTextField(placeholder: String?)
    func configureButton(title: String)
    func goToHome()
}

final class LoginViewController: UIViewController {
    
    private let homeComponent: HomeComponentProtocol
    private let presenter: LoginPresenterProtocol
    
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
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 2
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleButtonTapped() {
        presenter.buttonTapped(
            username: usernameTextfield.text,
            password: passwordTextfield.text
        )
    }
    
    init(
        homeComponent: HomeComponentProtocol,
        presenter: LoginPresenterProtocol
    ) {
        self.homeComponent = homeComponent
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)
        setupUI()
        presenter.initialLoad()
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func configureUsernameTextField(placeholder: String?, text: String?) {
        usernameTextfield.placeholder = placeholder
        usernameTextfield.text = text
    }
    
    func configurePasswordTextField(placeholder: String?) {
        passwordTextfield.placeholder = placeholder
    }
    
    func configureButton(title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func goToHome() {
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
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
}
