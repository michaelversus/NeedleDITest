//
//  UserDefaults+Extension.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import Foundation

enum UserDefaultsError: Error {
    case valueNotFound
    case failedDataCast
}

public extension UserDefaults {
    /// Retrieves a Codable object from UserDefaults.
    ///
    /// - Parameters:
    ///   - type: Class that conforms to the Codable protocol.
    ///   - key: Identifier of the object.
    ///   - decoder: Custom JSONDecoder instance. Defaults to `JSONDecoder()`.
    /// - Returns: Codable object for key (if exists).
    func object<T: Codable>(
        _ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()
    ) throws -> T {
        guard let data = self.value(forKey: key) as? Data else { throw UserDefaultsError.valueNotFound }
        return try decoder.decode(type.self, from: data)
    }

    /// Allows storing of Codable objects to UserDefaults.
    ///
    /// - Parameters:
    ///   - object: Codable object to store.
    ///   - key: Identifier of the object.
    ///   - encoder: Custom JSONEncoder instance. Defaults to `JSONEncoder()`.
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) throws {
        let data = try encoder.encode(object)
        self.set(data, forKey: key)
    }
}
