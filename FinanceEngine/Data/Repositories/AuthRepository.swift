//
//  AuthRepository.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation


final class AuthRepository: AuthRepositoryProtocol {
    
    private let apiClient: APIClientProtocol
    private let keychainManager: KeychainManagerProtocol
    
    init(apiClient: APIClientProtocol, keychainManager: KeychainManagerProtocol) {
        self.apiClient = apiClient
        self.keychainManager = keychainManager
    }
    
    func login(email: String, password: String) async throws -> AuthToken {
        let dto = try await apiClient.login(email: email, password: password)
        let domainEntity = dto.toDomain()
        try keychainManager.save(domainEntity, for: .authToken)
        return domainEntity
    }
    
    func register(firstName: String, lastName: String, email: String, password: String) async throws-> AuthToken {
        let dto = try await apiClient.register(firstName: firstName, lastName: lastName, email: email, password: password)
        let domainEntity = dto.toDomain()
        try keychainManager.save(domainEntity.self, for: .authToken)
        return dto.toDomain()
    }
    
    func logout() throws {
        try keychainManager.delete(for: .authToken)
    }
    
    func getStoredToken() throws -> AuthToken {
        try keychainManager.read(AuthToken.self, for: .authToken)
    }
    
    func isLoggedIn() -> Bool {
        (try? getStoredToken()) != nil
    }
}
