//
//  MockAccountUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-28.
//

import Foundation
final class MockAccountUseCase: GetAccountUseCaseProtocol {
    

    func execute() async throws -> Account {
        Account(id: "1", userName: "Hamza", email: "hamza@example.com", mobile: "12345667", balance: 12.12, createdAt: Date(), updatedAt: Date())
    }
}
