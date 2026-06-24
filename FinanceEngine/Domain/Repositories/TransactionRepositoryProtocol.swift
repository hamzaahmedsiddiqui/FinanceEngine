//
//  TransactionRepositoryProtocol.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//


protocol TransactionRepositoryProtocol {
    func getTransactions() async throws -> [Transaction]
}
