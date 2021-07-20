//
//  HomeComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol HomeComponentProtocol {
    var homeViewController: HomeViewController { get }
}

protocol HomeDependency: Dependency {
    var account: UserAccount { get }
}

final class HomeComponent: Component<HomeDependency>, HomeComponentProtocol {
    var homeViewController: HomeViewController {
        return HomeViewController(account: dependency.account)
    }
}
