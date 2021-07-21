//
//  TutorialComponent.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import NeedleFoundation

protocol TutorialComponentProtocol {
    var tutorialViewController: UIViewController { get }
}

protocol TutorialDependency: Dependency {
    var accountProvider: UserAccountProvider { get }
}

final class TutorialComponent: Component<TutorialDependency>, TutorialComponentProtocol {
    var tutorialViewController: UIViewController {
        return TutorialViewController(
            homeComponent: homeComponent,
            accountProvider: dependency.accountProvider
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
