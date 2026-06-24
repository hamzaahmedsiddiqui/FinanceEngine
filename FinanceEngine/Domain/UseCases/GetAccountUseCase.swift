//
//  FetchAccountUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-05.
//

import Foundation
protocol GetAccountUseCaseProtocol{
    func execute() async throws -> Account
}

final class GetAccountUseCase: GetAccountUseCaseProtocol {
    
    private let repository: AccountRepositoryProtocol
    
    init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> Account {
        try await repository.getAccount()
    }
}
