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
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateChildViewController()
    }
}

// MARK: - private helpers
fileprivate extension RootViewController {
    func updateChildViewController() {
        if let account = try? accountProvider.loadAccount() {
            navigationController?.present(homeComponent.homeViewController, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        } else {
            
        }
    }
    
    func handle(error: Error) {
        // TODO: handle errors
    }
}
