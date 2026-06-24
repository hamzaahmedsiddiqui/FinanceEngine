//
//  Transaction..swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-27.
//

import Foundation

struct Transaction {
    
    let id: String
    let amount: Decimal
    let currency: String
    let title: String
    let createdAt: Date
    let type: TransactionType
}


enum TransactionType: String, Decodable {
    case credit
    case debit
    case unknown
}
