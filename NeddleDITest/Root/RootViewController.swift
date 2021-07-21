//
//  RootViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

protocol RootViewControllerProtocol: AnyObject {
    func configureLabel(text: String)
    func configureButton(title: String)
    func goToLogin()
    func goToHome()
    func goToTutorial()
}

final class RootViewController: UIViewController {
    
    private let tutorialComponent: TutorialComponentProtocol
    private let loginComponent: LoginComponentProtocol
    private let homeComponent: HomeComponentProtocol
    private let presenter: RootPresenterProtocol
    
    private let initialLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
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
        presenter.buttonTapped()
    }
    
    init(
        tutorialComponent: TutorialComponentProtocol,
        loginComponent: LoginComponentProtocol,
        homeComponent: HomeComponentProtocol,
        presenter: RootPresenterProtocol
    ) {
        self.tutorialComponent = tutorialComponent
        self.loginComponent = loginComponent
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
        presenter.initialLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.load()
    }
}

extension RootViewController: RootViewControllerProtocol {
    func configureLabel(text: String) {
        initialLabel.text = text
    }
    
    func configureButton(title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func goToTutorial() {
        navigationController?.pushViewController(tutorialComponent.tutorialViewController, animated: true)
    }
    
    func goToHome() {
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
    }
    
    func goToLogin() {
        navigationController?.pushViewController(loginComponent.loginViewController, animated: false)
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
}
