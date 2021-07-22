//
//  LoginComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol LoginComponentProtocol {
    var loginViewController: UIViewController { get }
}

protocol LoginDependency: Dependency {
    var accountProvider: UserAccountProviderProtocol { get }
}

final class LoginComponent: Component<LoginDependency>, LoginComponentProtocol {
    var loginPresenter: LoginPresenterProtocol {
        return LoginPresenter(accountProvider: dependency.accountProvider)
    }
    
    var loginViewController: UIViewController {
        return LoginViewController(
            homeComponent: homeComponent,
            presenter: loginPresenter
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
