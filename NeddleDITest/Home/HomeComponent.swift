//
//  HomeComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol HomeComponentProtocol {
    var homeViewController: UIViewController { get }
}

protocol HomeDependency: Dependency {
    var accountProvider: UserAccountProvider { get }
}

final class HomeComponent: Component<HomeDependency>, HomeComponentProtocol {
    var homeViewController: UIViewController {
        return HomeViewController(accountProvider: dependency.accountProvider)
    }
}
