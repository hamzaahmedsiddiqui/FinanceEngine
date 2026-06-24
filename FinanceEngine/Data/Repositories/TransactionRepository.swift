//
//  TransactionRepository.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

protocol TransactionRepositoryProtocol {
    func getTransactions() async throws -> [Transaction]
}


final class TransactionRepository: TransactionRepositoryProtocol {
    private let apiClient: APIClientProtocol
    
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getTransactions() async throws -> [Transaction] {
        try await apiClient.getTransaction().map{ $0.toDomain() }
    }
}
