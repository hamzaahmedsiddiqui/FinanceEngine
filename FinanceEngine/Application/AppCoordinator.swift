//
//  AppCoordinator.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-28.
//

import Combine


protocol AppCoordinatorProtocol: AnyObject {
    var isLoggedIn: Bool { get }
    
    func loginSucceeded()
    func logout()
}



final class AppCoordinator: ObservableObject, AppCoordinatorProtocol{
    @Published var isLoggedIn: Bool = false
    
    func loginSucceeded() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}
