//
//  TransactionDTO.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-26.
//

import Foundation

struct TransactionDTO: Codable {
    let id: String
    let amount: Double
    let currency: String
    let title: String
    let createdAt: String
}

extension TransactionDTO {
    
    func toDomain() -> Transaction {
        Transaction(
            id: id,
            amount: Decimal(amount),
            currency: currency,
            title: title,
            createdAt: ISO8601DateFormatter().date(from: createdAt) ?? .now
        )
    }
}
