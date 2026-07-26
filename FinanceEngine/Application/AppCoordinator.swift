import Combine


protocol AppCoordinatorProtocol: AnyObject {
    var isLoggedIn: Bool { get }
    
    func loginSucceeded()
    func logout()
    func showRegister()
}

final class AppCoordinator: ObservableObject, AppCoordinatorProtocol{
    @Published var isLoggedIn: Bool = false
    @Published var isShowingRegister: Bool = false

    
    func loginSucceeded() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
    
    func showRegister() {
        isShowingRegister = true
    }
}
