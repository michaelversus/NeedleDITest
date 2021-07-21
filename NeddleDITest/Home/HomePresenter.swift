//
//  HomePresenter.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation
import FourSquareClient

protocol HomePresenterProtocol {
    func attach(_ view: HomeViewControllerProtocol)
    func initialLoad()
    func logout()
}

final class HomePresenter: HomePresenterProtocol {
    
    weak private var view: HomeViewControllerProtocol?
    private let dependency: HomeDependency
    
    init(dependency: HomeDependency) {
        self.dependency = dependency
    }
    
    func attach(_ view: HomeViewControllerProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
    }
    
    func initialLoad() {
        if let account = try? dependency.accountProvider.loadAccount() {
            view?.configureLabel(text: "Welcome \(account.username)")
        } else {
            view?.configureLabel(text: "Something went wrong")
        }
        let venuesRequest = VenuesExploreRequest(
            date: 20180323,
            lat: 40.7243,
            lon: -74.0018,
            category: "coffee",
            limit: 1
        )
        let venuesEndpoint = dependency.foursquareAPI.venues(request: venuesRequest)
        URLSession.shared.load(venuesEndpoint) { result in
            switch result {
            case .success(let response):
                dump(response)
            case .failure(let error):
                dump(error)
            }
        }
    }
    
    func logout() {
        dependency.accountProvider.reset()
        view?.popToRoot()
    }
}
