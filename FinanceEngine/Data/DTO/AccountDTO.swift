//
//  AccountDTO.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-28.
//

import Foundation

struct AccountDTO: Codable {
    let id: String
    let userName: String
    let email: String
    let mobile: String
    let balance: Double
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
}

extension AccountDTO {
    
    func toDomain() -> Account {
        
        let formatter =
        ISO8601DateFormatter()
        
        return Account(
            id: id,
            userName: userName,
            email: email,
            mobile: mobile,
            balance: Decimal(balance),
            createdAt:formatter.date(from: createdAt) ?? .now,
            updatedAt: formatter.date(from: updatedAt) ?? .now,
            deletedAt: deletedAt.flatMap { formatter.date(from: $0) }
        )
    }
}
