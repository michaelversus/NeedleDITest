//
//  RootPresenter.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation

protocol RootPresenterProtocol {
    func attach(_ view: RootViewControllerProtocol)
    func initialLoad()
    func load()
    func buttonTapped()
}

final class RootPresenter: RootPresenterProtocol {
    
    weak private var view: RootViewControllerProtocol?
    private let accountProvider: UserAccountProviderProtocol
    
    init(accountProvider: UserAccountProviderProtocol) {
        self.accountProvider = accountProvider
    }
    
    func attach(_ view: RootViewControllerProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
    }
    
    func initialLoad() {
        view?.configureLabel(text: "Initial Screen")
    }
    
    func load() {
        if let account = try? accountProvider.loadAccount() {
            if account.shouldShowTutorial {
                view?.configureButton(title: "Tutorial")
            } else {
                view?.configureButton(title: "Home")
            }
        } else {
            view?.configureButton(title: "Login")
        }
    }
    
    func buttonTapped() {
        if let account = try? accountProvider.loadAccount() {
            if account.shouldShowTutorial {
                view?.goToTutorial()
            } else {
                view?.goToHome()
            }
        } else {
            view?.goToLogin()
        }
    }
}
