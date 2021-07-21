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

    override func setUpWithError() throws {
        accountProvider = MockUserAccountProvider()
        tutorialComponent = MockTutorialComponent()
        rootViewController = RootViewController(
            accountProvider: accountProvider,
            tutorialComponent: tutorialComponent,
            loginComponent: <#T##LoginComponentProtocol#>,
            homeComponent: <#T##HomeComponentProtocol#>
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
