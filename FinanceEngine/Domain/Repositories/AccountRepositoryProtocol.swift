//
//  AccountRepositoryProtocol.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//


protocol AccountRepositoryProtocol {
    func getAccount() async throws -> Account
}
