//
//  MockData.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-29.
//

import Foundation

enum MockData {
    
    static let mockTransactions: [Transaction] = [
        Transaction(id: UUID(), amount: 250.00, currency: "USD", title: "Netflix", createdAt: Date(), type: .debit),
        Transaction(id: UUID(), amount: 1500.00, currency: "USD", title: "Salary", createdAt: Date(), type: .credit),
        Transaction(id: UUID(), amount: 45.00, currency: "USD", title: "Uber", createdAt: Date(), type: .debit),
        Transaction(id: UUID(), amount: 800.00, currency: "USD", title: "Freelance", createdAt: Date(), type: .credit),
        Transaction(id: UUID(), amount: 120.00, currency: "USD", title: "Groceries", createdAt: Date(), type: .debit)
    ]
    
    static let account = Account(
            id: "1",
            userName: "Hamza",
            email: "hamza@test.com",
            mobile: "123456789",
            balance: 24580.20,
            createdAt: Date(),
            updatedAt: Date()
        )
}
