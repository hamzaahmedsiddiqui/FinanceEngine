//
//  KeychainManager.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation

enum KeychainError: Error {
    case saveFailed
    case readFailed
    case deleteFailed
    case dataConversionFailed
}

enum KeychainKey: String {
    case authToken = "auth_token"
}


protocol KeychainManagerProtocol {
    func save<T: Encodable>(_ object: T, for key: KeychainKey) throws
    func read<T: Decodable>(_ type: T.Type, for key: KeychainKey) throws -> T
    func delete(for key: KeychainKey) throws
}

final class KeychainManager: KeychainManagerProtocol {
    
    func save<T: Encodable>(_ object: T,for key: KeychainKey) throws  {
        
        let jsonData = try JSONEncoder().encode(object)
        guard let data = String(data: jsonData, encoding: .utf8) else {
            throw KeychainError.dataConversionFailed
        }
        
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        // Delete the old value
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.saveFailed
        }
    }
    
    func delete(for key: KeychainKey) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.deleteFailed
        }
    }
    
    func read<T: Decodable>(_ type: T.Type, for key: KeychainKey) throws -> T {
        
        let value = try readFromKeychain(for: key)
        
        guard let data = value.data(using: .utf8) else {
            throw KeychainError.dataConversionFailed
        }
        return try JSONDecoder().decode(type, from: data)
    }
    
    private func readFromKeychain(for key: KeychainKey) throws -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        
        guard status == errSecSuccess,
              let data = result as? Data,
              let value = String(data: data, encoding: .utf8) else {
            throw KeychainError.readFailed
        }
        
        return value
    }
}
