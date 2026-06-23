//
//  FetchAccountUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-05.
//

import Foundation
protocol FetchAccountUseCaseProtocol{
    func execute() async throws -> Account
}

final class FetchAccountUseCase: FetchAccountUseCaseProtocol {
    
    private let repository: AccountRepositoryProtocol
    
    init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> Account {
        try await repository.fetchAccount()
    }
}
