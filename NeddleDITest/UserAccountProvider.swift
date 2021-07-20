//
//  UserAccountProvider.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import Foundation

protocol UserAccountProviderProtocol {
    func save(_ account: UserAccount) throws
    func loadAccount() throws -> UserAccount?
    func reset()
}

final class UserAccountProvider: UserAccountProviderProtocol {
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func save(_ account: UserAccount) throws {
        try userDefaults.set(object: account, forKey: UserAccount.key)
    }
    
    func loadAccount() throws -> UserAccount? {
        return try self.userDefaults.object(UserAccount.self, with: UserAccount.key)
    }
    
    func reset() {
        userDefaults.set(nil, forKey: UserAccount.key)
    }
}

struct UserAccount: Codable {
    let username: String
    let shouldShowTutorial: Bool
}

extension UserAccount {
    static let key: String = "account_key"
}
