//
//  GetTransactionsUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation
protocol GetTransactionsUseCaseProtocol{
    func execute() async throws -> [Transaction]
}

final class GetTransactionsUseCase: GetTransactionsUseCaseProtocol {
    
    private let repository: TransactionRepositoryProtocol
    
    init(repository: TransactionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Transaction] {
        try await repository.getTransactions()
    }
}

