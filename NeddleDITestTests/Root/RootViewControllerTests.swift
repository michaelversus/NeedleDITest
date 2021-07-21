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
    private var tutorialComponent: MockTutorialComponent!
    private var loginComponent: MockLoginComponent!
    private var homeComponent: MockHomeComponent!
    private var rootPresenter: MockRootPresenter!

    override func setUpWithError() throws {
        tutorialComponent = MockTutorialComponent()
        loginComponent = MockLoginComponent()
        homeComponent = MockHomeComponent()
        rootPresenter = MockRootPresenter()
        rootViewController = RootViewController(
            tutorialComponent: tutorialComponent,
            loginComponent: loginComponent,
            homeComponent: homeComponent,
            presenter: rootPresenter
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewDidLoad() {
        // Given, When
        _ = rootViewController.view
        
        // Then
        XCTAssertEqual(rootPresenter.actions, [.attach, .initialLoad])
    }
    
    func test_handleButtonTapped() {
        // Given, When
        rootViewController.handleButtonTapped()
        
        // Then
        XCTAssertEqual(rootPresenter.actions, [.buttonTapped])
    }
    
    func test_viewDidAppear() {
        // Given, When
        rootViewController.viewDidAppear(true)
        
        // Then
        XCTAssertEqual(rootPresenter.actions, [.load])
    }
    
    func test_goToTutorial() {
        // Given
        _ = UINavigationController(rootViewController: rootViewController)
        
        // When
        rootViewController.goToTutorial()
        
        // Then
        XCTAssertEqual(tutorialComponent.tutorialViewControllerCallCount, 1)
    }
    
    func test_goToHome() {
        // Given
        _ = UINavigationController(rootViewController: rootViewController)
        
        // When
        rootViewController.goToHome()
        
        // Then
        XCTAssertEqual(homeComponent.homeViewControllerCallCount, 1)
    }
    
    func test_goToLogin() {
        // Given
        _ = UINavigationController(rootViewController: rootViewController)
        
        // When
        rootViewController.goToLogin()
        
        // Then
        XCTAssertEqual(loginComponent.loginViewControllerCallCount, 1)
    }
}
