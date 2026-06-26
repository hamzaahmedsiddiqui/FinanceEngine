//
//  FinanceEngineApp.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-25.
//

import SwiftUI

@main
struct FinanceEngineApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: AppCompositionRoot.makeLoginViewModel())
        }
    }
}
