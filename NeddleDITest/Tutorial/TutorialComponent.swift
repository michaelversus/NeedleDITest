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

final class TutorialComponent: Component<EmptyDependency>, TutorialComponentProtocol {
    var tutorialViewController: TutorialViewController {
        return TutorialViewController(
            loginComponent: loginComponent
        )
    }
    
    var loginComponent: LoginComponent {
        return LoginComponent(parent: self)
    }
}
