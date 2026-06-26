//
//  RegisterUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation



protocol RegisterUseCaseProtocol {
    func register(firstName: String, lastName: String, email: String, password: String) async throws -> AuthToken
}


final class RegisterUseCase: RegisterUseCaseProtocol {
    let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func register(firstName: String, lastName: String, email: String, password: String) async throws -> AuthToken {
        try await authRepository.register(firstName: firstName, lastName: lastName, email: email, password: password)
    }
}
