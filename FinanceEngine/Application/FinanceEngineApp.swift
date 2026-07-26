
import Combine
import SwiftUI

@main
struct FinanceEngineApp: App {
    
    @StateObject private var appCoordinator =  AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            if appCoordinator.isLoggedIn {
                DashboardView(vm: AppCompositionRoot.makeDashboardViewModel(coordinator: appCoordinator))
            } else {
                LoginView(viewModel: AppCompositionRoot.makeLoginViewModel(coordinator: appCoordinator))
            }
        }
    }
}
