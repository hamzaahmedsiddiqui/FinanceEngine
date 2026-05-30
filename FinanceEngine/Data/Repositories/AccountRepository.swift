//
//  AccountRepository.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-29.
//

import Foundation
protocol AccountRepositoryProtocol {
    func fetchAccount() async throws -> Account
}

final class AccountRepository: AccountRepositoryProtocol {
    private let httpClient: HTTPClientProtocol
    init (httpClient:HTTPClientProtocol){
        self.httpClient = httpClient
    }
    
    func fetchAccount() async throws -> Account {
       
                                                
    }
}
