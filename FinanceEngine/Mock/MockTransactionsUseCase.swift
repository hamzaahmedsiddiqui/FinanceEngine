//
//  MockTransactionsUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-28.
//

import Foundation

final class MockTransactionsUseCase: GetTransactionsUseCaseProtocol {
    func execute() async throws -> [Transaction] {
        [
            Transaction(
                id: UUID(),
                amount: 12.32,
                currency: "dollar",
                title: "test transaction",
                createdAt: Date(),
                type: .credit
            ),
            Transaction(
                id: UUID(),
                amount: 15.32,
                currency: "dollar",
                title: "test transaction 2",
                createdAt: Date(),
                type: .debit
            ),
        ]
    }
}
