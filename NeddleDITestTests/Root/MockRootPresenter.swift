//
//  MockRootPresenter.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation
@testable import NeddleDITest

final class MockRootPresenter: RootPresenterProtocol {
    enum Action {
        case attach
        case initialLoad
        case load
        case buttonTapped
    }
    
    var actions: [Action] = []
    
    func attach(_ view: RootViewControllerProtocol) {
        actions.append(.attach)
    }
    
    func initialLoad() {
        actions.append(.initialLoad)
    }
    
    func load() {
        actions.append(.load)
    }
    
    func buttonTapped() {
        actions.append(.buttonTapped)
    }
}
