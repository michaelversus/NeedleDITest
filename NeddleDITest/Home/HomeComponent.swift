//
//  HomeComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation
import FourSquareClient

protocol HomeComponentProtocol {
    var homeViewController: UIViewController { get }
}

protocol HomeDependency: Dependency {
    var accountProvider: UserAccountProvider { get }
    var foursquareAPI: FoursquareAPIProtocol.Type { get }
}

final class HomeComponent: Component<HomeDependency>, HomeComponentProtocol {
    var homePresenter: HomePresenterProtocol {
        return HomePresenter(dependency: dependency)
    }
    
    var homeViewController: UIViewController {
        return HomeViewController(presenter: homePresenter)
    }
}
