//
//  MockUserAccountProvider.swift
//  NeddleDITestTests
//
//  Created by MIC KARAGIORGOS on 7/20/21.
//

import Foundation
@testable import NeddleDITest

final class MockUserAccountProvider: UserAccountProviderProtocol {
    enum Action {
        case save(UserAccount)
        case loadAccount
        case reset
    }
    var actions: [Action] = []
    var account: UserAccount?
    
    func save(_ account: UserAccount) throws {
        actions.append(.save(account))
        self.account = account
    }
    
    func loadAccount() throws -> UserAccount? {
        actions.append(.loadAccount)
        return account
    }
    
    func reset() {
        actions.append(.reset)
        account = nil
    }
}
