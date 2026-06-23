//
//  APIClient.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-23.
//

import Foundation

protocol APIClientProtocol: APIClientAccountProtocol, APIClientTransactionProtocol{}

protocol APIClientAccountProtocol{
    func getAccount() async throws -> AccountDTO
}

protocol APIClientTransactionProtocol{
    func getTransaction() async throws -> [TransactionDTO]
}


final class APIClient: APIClientProtocol{
    
    private let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getAccount() async throws -> AccountDTO {
        try await httpClient.request(endpoint: .account())
    }
    
    func getTransaction() async throws -> [TransactionDTO] {
        try await httpClient.request(endpoint: .transactions())
    }
}
