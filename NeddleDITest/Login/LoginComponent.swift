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

final class LoginComponent: Component<EmptyDependency>, LoginComponentProtocol {
    var loginViewController: LoginViewController {
        return LoginViewController(
            homeComponent: homeComponent
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
