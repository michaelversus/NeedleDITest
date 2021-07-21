//
//  TutorialPresenter.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation

protocol TutorialPresenterProtocol {
    func attach(_ view: TutorialViewControllerProtocol)
    func initialLoad()
    func buttonTapped()
}

final class TutorialPresenter: TutorialPresenterProtocol {
    
    weak private var view: TutorialViewControllerProtocol?
    private let accountProvider: UserAccountProviderProtocol
    
    init(accountProvider: UserAccountProviderProtocol) {
        self.accountProvider = accountProvider
    }
    
    func attach(_ view: TutorialViewControllerProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
    }
    
    func initialLoad() {
        view?.configureLabel(text: "Tutorial screen!")
        view?.configureButton(title: "Go to home")
    }
    
    func buttonTapped() {
        guard let account = try? accountProvider.loadAccount() else { return }
        let newAccount = UserAccount(username: account.username, shouldShowTutorial: false)
        try! accountProvider.save(newAccount)
        view?.goToHome()
    }
}
