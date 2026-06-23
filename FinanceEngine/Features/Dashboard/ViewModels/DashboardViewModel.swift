//
//  DashboardViewModel.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-05.
//

import Foundation
import Combine

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published private(set) var account: Account?
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage:String?
    
    private let fetchAccountUseCase: FetchAccountUseCaseProtocol
    
    init(fetchAccountUseCase: FetchAccountUseCaseProtocol) {
        self.fetchAccountUseCase = fetchAccountUseCase
    }
    
    func loadAccount() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            
            let account = try await fetchAccountUseCase.execute()
            self.account = account
            
        } catch {
            
            errorMessage = error.localizedDescription
            
        }
    }
}
