//
//  TutorialComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol TutorialComponentProtocol {
    var tutorialViewController: TutorialViewController { get }
}

protocol TutorialDependency: Dependency {
    var accountProvider: UserAccountProvider { get }
}

final class TutorialComponent: Component<TutorialDependency>, TutorialComponentProtocol {
    var tutorialViewController: TutorialViewController {
        return TutorialViewController(
            homeComponent: homeComponent,
            accountProvider: dependency.accountProvider
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
