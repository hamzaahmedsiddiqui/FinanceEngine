//
//  Endpoint.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-25.
//

import Foundation

struct Endpoint<Response: Decodable> {
    let path: String
    let method: HTTPMethod
    let queryItems: [URLQueryItem]
    let body: AnyEncodable?
    let requiresAuth: Bool
    
    init(
        path: String,
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
            path: "accounts",
            method: .get
        )
    }
}


// transaction End point
extension Endpoint where Response == [TransactionDTO]{
    static func transactions() -> Self {
        Endpoint(
            path: "transactions",
            method: .get
        )
    }
}


