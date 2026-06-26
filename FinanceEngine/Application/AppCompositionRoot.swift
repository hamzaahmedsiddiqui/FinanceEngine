//
//  AppCompositionRoot.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-25.
//

import Foundation


final class AppCompositionRoot {
    static func makeLoginViewModel() -> LoginViewModel {
        let requestBuilder = RequestBuilder()
        let httpClient = HTTPClient(session: URLSession.shared, requestBuilder: requestBuilder)
        let apiClient = APIClient(httpClient: httpClient)
        let keychain = KeychainManager()
        let authRepo = AuthRepository(apiClient: apiClient, keychainManager: keychain)
        let loginUseCase = LoginUseCase(authRepository: authRepo)
        return LoginViewModel(loginUseCase: loginUseCase)
    }
}
