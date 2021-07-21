//
//  RootComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

final class RootComponent: BootstrapComponent {
    var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    var accountProvider: UserAccountProvider {
        return shared { UserAccountProvider(userDefaults: userDefaults) }
    }
    
    var rootPresenter: RootPresenterProtocol {
        return RootPresenter(accountProvider: accountProvider)
    }
    
    var rootViewController: RootViewController {
        return RootViewController(
            tutorialComponent: tutorialComponent,
            loginComponent: loginComponent,
            homeComponent: homeComponent,
            presenter: rootPresenter
        )
    }
    
    var tutorialComponent: TutorialComponent {
        return TutorialComponent(parent: self)
    }
    
    var loginComponent: LoginComponent {
        return LoginComponent(parent: self)
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
