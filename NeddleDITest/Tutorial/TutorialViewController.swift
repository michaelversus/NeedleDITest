//
//  TutorialViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class TutorialViewController: UIViewController {
    
    private let homeComponent: HomeComponentProtocol
    private let accountProvider: UserAccountProviderProtocol
    
    private let label: UILabel = {
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

fileprivate extension TutorialViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureUI() {
        label.text = "Tutorial screen!"
        button.setTitle("Go to home", for: .normal)
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
    }
    
    @objc func goToHome() {
        guard let account = try? accountProvider.loadAccount() else { return }
        let newAccount = UserAccount(username: account.username, shouldShowTutorial: false)
        try! accountProvider.save(newAccount)
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
    }
}
