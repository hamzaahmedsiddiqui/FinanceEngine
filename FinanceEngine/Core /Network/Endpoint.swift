//
//  Endpoint.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-25.
//

import Foundation

enum EndpointPath: String {
    case userAccount = "/user/accounts"
    case userTransaction = "/user/transactions"
    case register = "auth/register"
    case login = "auth/login"
}


struct Endpoint<Response: Decodable> {
    let path: EndpointPath
    let method: HTTPMethod
    let queryItems: [URLQueryItem]
    let body: AnyEncodable?
    let requiresAuth: Bool
    
    init(
        path: EndpointPath,
        method: HTTPMethod,
        queryItems:[URLQueryItem] = [],
        body: AnyEncodable? = nil,
        requiresAuth: Bool = true
    ) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
        self.body = body
        self.requiresAuth = requiresAuth
    }
}

// Account End point
extension Endpoint where Response == AccountDTO{
    static func account() -> Self {
        Endpoint(
            path: .userAccount,
            method: .get
        )
    }
}


// transaction End point
extension Endpoint where Response == [TransactionDTO]{
    static func transactions() -> Self {
        Endpoint(
            path: .userTransaction,
            method: .get
        )
    }
}


extension Endpoint where Response == AuthTokenDTO {
    
    private struct LoginRequest: Encodable {
        let email: String
        let password: String
    }
    
    private struct RegistrationRequest: Encodable {
        let firstName: String
        let lastName: String
        let email: String
        let password: String
    }
    
    static func login(email: String, password: String) -> Self {
        Endpoint(path: .login, method: .post, body: AnyEncodable(LoginRequest(email: email, password: password)))
    }
    
    static func register(firstName: String, lastName: String, email: String, password: String) -> Self {
        Endpoint(path: .register, method: .post, body: AnyEncodable(RegistrationRequest(firstName: firstName, lastName: lastName, email: email, password: password)))
    }
    
}


