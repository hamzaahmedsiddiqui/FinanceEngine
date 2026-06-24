//
//  TransactionDTO.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-26.
//

import Foundation

struct TransactionDTO: Decodable {
    let id: String
    let amount: Double
    let currency: String
    let title: String
    let createdAt: Date
    let type: String
}

extension TransactionDTO {
    
    func toDomain() -> Transaction {
        Transaction(
            id: id,
            amount: Decimal(amount),
            currency: currency,
            title: title,
            createdAt: createdAt,
            type: TransactionType(rawValue: type) ?? .unknown
        )
    }
}
