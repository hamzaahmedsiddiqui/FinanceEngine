//
//  AuthRepositoryProtocol.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation


protocol AuthRepositoryProtocol {
    func login(email: String, password: String) async throws -> AuthToken
    func register(firstName: String, lastName: String, email: String, password: String) async throws-> AuthToken
    func logout() throws
    func getStoredToken() async throws -> AuthToken
    func isLoggedIn() -> Bool
}
