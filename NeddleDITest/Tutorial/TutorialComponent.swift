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
    var accountProvider: UserAccountProviderProtocol { get }
}

final class TutorialComponent: Component<TutorialDependency>, TutorialComponentProtocol {
    var tutorialPresenter: TutorialPresenterProtocol {
        return TutorialPresenter(accountProvider: dependency.accountProvider)
    }
    
    var tutorialViewController: UIViewController {
        return TutorialViewController(
            homeComponent: homeComponent,
            presenter: tutorialPresenter
        )
    }
    
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
}
