//
//  LoginComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol LoginComponentProtocol {
    var loginViewController: LoginViewController { get }
}

protocol LoginDependency: Dependency {
    var accountProvider: UserAccountProvider { get }
}

final class LoginComponent: Component<LoginDependency>, LoginComponentProtocol {
    var loginViewController: LoginViewController {
        return LoginViewController(
            homeComponent: homeComponent,
            accountProvider: dependency.accountProvider
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
