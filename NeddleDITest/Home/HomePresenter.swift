//
//  HomePresenter.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation

protocol HomePresenterProtocol {
    func attach(_ view: HomeViewControllerProtocol)
    func initialLoad()
    func logout()
}

final class HomePresenter: HomePresenterProtocol {
    
    weak private var view: HomeViewControllerProtocol?
    private let accountProvider: UserAccountProviderProtocol
    
    init(accountProvider: UserAccountProviderProtocol) {
        self.accountProvider = accountProvider
    }
    
    func attach(_ view: HomeViewControllerProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
    }
    
    func initialLoad() {
        if let account = try? accountProvider.loadAccount() {
            view?.configureLabel(text: "Welcome \(account.username)")
        } else {
            view?.configureLabel(text: "Something went wrong")
        }
    }
    
    func logout() {
        accountProvider.reset()
        view?.popToRoot()
    }
}
