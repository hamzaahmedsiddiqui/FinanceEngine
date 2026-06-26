//
//  APIClient.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-23.
//

import Foundation

protocol APIClientProtocol: APIClientAccountProtocol, APIClientTransactionProtocol,APIClientLoginProtocol, APIClientRegisterProtocol{
}

protocol APIClientAccountProtocol{
    func getAccount() async throws -> AccountDTO
}

protocol APIClientTransactionProtocol{
    func getTransaction() async throws -> [TransactionDTO]
}

protocol APIClientLoginProtocol{
    func login(
        email: String,
        password: String
    ) async throws -> AuthTokenDTO
}

protocol APIClientRegisterProtocol{
    func register(
        firstName: String,
        lastName: String,
        email: String,
        password: String
    ) async throws-> AuthTokenDTO
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
    
    func login(email: String, password: String) async throws -> AuthTokenDTO {
        try await httpClient.request(endpoint: .login(email: email, password: password))
    }
    
    func register(firstName: String, lastName: String, email: String, password: String) async throws-> AuthTokenDTO {
        try await httpClient.request(endpoint: .register(firstName: firstName, lastName: lastName, email: email, password: password))
    }
}
