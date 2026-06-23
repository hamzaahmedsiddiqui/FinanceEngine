//
//  AccountDTO.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-28.
//

import Foundation

struct AccountDTO: Decodable {
    
    let id: String
    let userName: String
    let email: String
    let mobile: String
    let balance: Decimal
    let createdAt: Date
    let updatedAt: Date
    let deletedAt: Date?
}

extension AccountDTO {
    private static let formatter = ISO8601DateFormatter()

    func toDomain() -> Account {
                
        return Account(
            id: id,
            userName: userName,
            email: email,
            mobile: mobile,
            balance: balance,
            createdAt:  createdAt,
            updatedAt:  updatedAt
        )
    }
}
