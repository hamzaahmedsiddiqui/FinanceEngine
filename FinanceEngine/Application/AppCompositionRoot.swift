//
//  AppCompositionRoot.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-25.
//

import Foundation

final class AppCompositionRoot {
    private static let keychain = KeychainManager()

    // Shared networking stack for factories below
    private static let apiClient: APIClient = {
        let httpClient = HTTPClient(
            session: URLSession.shared,
            requestBuilder: RequestBuilder()
        )
        return APIClient(httpClient: httpClient)
    }()
    
    static func makeLoginViewModel(coordinator: AppCoordinator) -> LoginViewModel {
//        let authRepo = AuthRepository(
//            apiClient: Self.apiClient,
//            keychainManager: keychain
//        )
//        let loginUseCase = LoginUseCase(authRepository: authRepo)
        let loginUseCase = MockLoginUseCase()
        return LoginViewModel(
            loginUseCase: loginUseCase,
            coordinator: coordinator
        )
    }
    
    static func makeDashboardViewModel(coordinator: AppCoordinator) -> DashboardViewModel {
        let accountRepository = AccountRepository(apiClient: Self.apiClient)
        let accountUseCase = GetAccountUseCase(repository: accountRepository)
        
        let transactionRepository = TransactionRepository(apiClient: self.apiClient)
        let transactionsUseCase: GetTransactionsUseCaseProtocol  =  GetTransactionsUseCase(repository: transactionRepository)
        
        
        return DashboardViewModel(
            getAccountUseCase: accountUseCase,
            getTransactionsUseCase: transactionsUseCase)
    }
}
