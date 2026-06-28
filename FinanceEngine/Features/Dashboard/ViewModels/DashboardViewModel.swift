//
//  DashboardViewModel.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-05.
//

import Foundation
import Combine

protocol DashboardViewModelProtocol: ObservableObject{
    var account: Account? {get}
    var transactions: [Transaction] {get}
    var isLoading: Bool {get}
    var errorMessage: String? {get}
    
    func loadDashboard() async
}

@MainActor
final class DashboardViewModel: DashboardViewModelProtocol {
    @Published private(set) var account: Account?
    @Published private(set) var transactions: [Transaction] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage:String?
    
    private let getAccountUseCase: GetAccountUseCaseProtocol
    private let getTransactionsUseCase: GetTransactionsUseCaseProtocol
    
    init(getAccountUseCase: GetAccountUseCaseProtocol, getTransactionsUseCase: GetTransactionsUseCaseProtocol) {
        self.getAccountUseCase = getAccountUseCase
        self.getTransactionsUseCase = getTransactionsUseCase
    }
    
    func loadDashboard() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            
            async let account = getAccountUseCase.execute()
            async let transcations = getTransactionsUseCase.execute()
            
            self.account =  try await account
            self.transactions =  try await transcations
            
        } catch {
            
            errorMessage = error.localizedDescription
            
        }
    }
    
    
}
