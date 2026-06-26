//
//  LoginUseCase.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//



import Foundation

protocol LoginUseCaseProtocol {
    func login(email: String, password: String) async throws -> AuthToken
}


final class LoginUseCase: LoginUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func login(email: String, password: String) async throws -> AuthToken {
        try await authRepository.login(email: email, password: password)
    }
}

