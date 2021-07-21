//
//  MockTutorialComponent.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/20/21.
//

import UIKit
@testable import NeddleDITest

final class MockTutorialComponent: TutorialComponentProtocol {
    let vc = UIViewController()
    var tutorialViewControllerCallCount = 0
    
    var tutorialViewController: UIViewController {
        tutorialViewControllerCallCount += 1
        return vc
    }
}
