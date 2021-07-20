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
    
    var account: UserAccount? {
        return shared { try? accountProvider.loadAccount() }
    }
    
    var rootViewController: RootViewController {
        return RootViewController(
            accountProvider: accountProvider,
            tutorialComponent: tutorialComponent,
            loginComponent: loginComponent,
            homeComponent: homeComponent
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
