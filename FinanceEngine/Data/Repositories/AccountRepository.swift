//
//  AccountRepository.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-29.
//

import Foundation
protocol AccountRepositoryProtocol {
    func fetchAccount() async throws -> Account
}

final class AccountRepository: AccountRepositoryProtocol {
    private let apiClient: APIClientProtocol
    
    init (apiClient:APIClientProtocol){
        self.apiClient = apiClient
    }
    
    func fetchAccount() async throws -> Account {
        let dto = try await apiClient.getAccount()
        
        guard dto.deletedAt == nil else {
            throw RepositoriesError.accountDeleted
        }
        
        return dto.toDomain()
    }
}
