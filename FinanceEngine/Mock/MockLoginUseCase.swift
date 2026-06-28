//
//  MockLoginUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-25.
//

import Foundation

final class MockLoginUseCase: LoginUseCaseProtocol {
    func login(email: String, password: String) async throws -> AuthToken {
        AuthToken(
            accessToken: "test",
            refreshToken: "test",
            userId: "1",
            expiresIn: 3600
        )
    }
}
