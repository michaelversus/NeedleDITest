//
//  MockHomeComponent.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import UIKit
@testable import NeddleDITest

final class MockHomeComponent: HomeComponentProtocol {
    let vc = UIViewController()
    var homeViewControllerCallCount = 0
    
    var homeViewController: UIViewController {
        homeViewControllerCallCount += 1
        return vc
    }
}
