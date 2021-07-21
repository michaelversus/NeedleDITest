//
//  RootViewControllerTests.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/20/21.
//

import XCTest
@testable import NeddleDITest

class RootViewControllerTests: XCTestCase {
    
    private var rootViewController: RootViewController!
    private var accountProvider: MockUserAccountProvider!
    private var tutorialComponent: MockTutorialComponent!
    private var loginComponent: MockLoginComponent!
    private var homeComponent: MockHomeComponent!

    override func setUpWithError() throws {
        accountProvider = MockUserAccountProvider()
        tutorialComponent = MockTutorialComponent()
        loginComponent = MockLoginComponent()
        homeComponent = MockHomeComponent()
        rootViewController = RootViewController(
            accountProvider: accountProvider,
            tutorialComponent: tutorialComponent,
            loginComponent: loginComponent,
            homeComponent: homeComponent
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewDidLoad_givenNilAccount_setupsLoginUI() {
        // Given
        accountProvider.account = nil
        
        // When
        rootViewController.viewDidLoad()
        
        // Then
    }
}
