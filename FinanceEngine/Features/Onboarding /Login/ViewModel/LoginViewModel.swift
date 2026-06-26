//
//  LoginViewModel.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-25.
//
import Combine
import Foundation
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoggedIn: Bool = false
    
    
    private let loginUseCase: LoginUseCaseProtocol
    
    init( loginUseCase: LoginUseCaseProtocol) {
        self.loginUseCase = loginUseCase
    }
    
    
    func login() async {
        isLoading = true
        defer {
            isLoading = false
        }
        guard validation() else { return }
        
        do {
            let _ = try await loginUseCase.login(email: self.email, password: self.password)
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    private func validation() -> Bool {
        print(email)
        guard !email.isEmpty, email.contains("@") else {
            errorMessage = "Invalid email"
            return false
        }
        guard password.count >= 8 else {
            errorMessage = "Password too short"
            return false
        }
        return true
    }
    
}

