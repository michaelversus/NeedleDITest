//
//  LoginPresenter.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation

protocol LoginPresenterProtocol {
    func attach(_ view: LoginViewControllerProtocol)
    func initialLoad()
    func buttonTapped(username: String?, password: String?)
}

final class LoginPresenter: LoginPresenterProtocol {
    
    weak private var view: LoginViewControllerProtocol?
    private let accountProvider: UserAccountProviderProtocol
    
    init(accountProvider: UserAccountProviderProtocol) {
        self.accountProvider = accountProvider
    }
    
    func attach(_ view: LoginViewControllerProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
    }
    
    func initialLoad() {
        view?.configureUsernameTextField(
            placeholder: "username",
            text: nil
        )
        if let account = try? accountProvider.loadAccount() {
            view?.configureUsernameTextField(
                placeholder: "username",
                text: account.username
            )
            view?.configureButton(title: "Login")
        } else {
            view?.configureButton(title: "Register")
        }
    }
    
    func buttonTapped(username: String?, password: String?) {
        if (try? accountProvider.loadAccount()) == nil {
            guard let username = username else { return }
            guard let _ = password else { return }
            try! accountProvider.save(UserAccount(username: username, shouldShowTutorial: true))
        }
        view?.goToHome()
    }
}
