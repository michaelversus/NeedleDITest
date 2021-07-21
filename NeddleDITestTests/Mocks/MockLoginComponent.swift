//
//  MockLoginComponent.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import UIKit
@testable import NeddleDITest

final class MockLoginComponent: LoginComponentProtocol {
    let vc = UIViewController()
    var loginViewControllerCallCount = 0
    
    var loginViewController: UIViewController {
        loginViewControllerCallCount += 1
        return vc
    }
}
