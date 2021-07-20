//
//  RootViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class RootViewController: UIViewController {
    
    private let tutorialComponent: TutorialComponentProtocol
    private let loginComponent: LoginComponentProtocol
    private let homeComponent: HomeComponentProtocol
    private let accountProvider: UserAccountProviderProtocol
    
    private let initialLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
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
        accountProvider: UserAccountProviderProtocol,
        tutorialComponent: TutorialComponentProtocol,
        loginComponent: LoginComponentProtocol,
        homeComponent: HomeComponentProtocol
    ) {
        self.tutorialComponent = tutorialComponent
        self.loginComponent = loginComponent
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

// MARK: - private helpers
fileprivate extension RootViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(initialLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            initialLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            initialLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            initialLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: initialLabel.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureUI() {
        initialLabel.text = "Initial Screen"
        
        if let account = try? accountProvider.loadAccount() {
            if account.shouldShowTutorial {
                button.setTitle("Tutorial", for: .normal)
                button.addTarget(self, action: #selector(goToTutorial), for: .touchUpInside)
            } else {
                button.setTitle("Home", for: .normal)
                button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
            }
        } else {
            button.setTitle("Login", for: .normal)
            button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        }
    }
    
    @objc func goToTutorial() {
        navigationController?.present(tutorialComponent.tutorialViewController, animated: true, completion: nil)
    }
    
    @objc func goToHome() {
        navigationController?.present(homeComponent.homeViewController, animated: true, completion: nil)
    }
    
    @objc func goToLogin() {
        navigationController?.present(loginComponent.loginViewController, animated: false, completion: nil)
    }
}
