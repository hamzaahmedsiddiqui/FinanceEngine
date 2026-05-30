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
}

// Account End point
extension Endpoint where Response == AccountDTO{
    static func account() -> Self {
        Endpoint(
            path: "accounts",
            method: .get,
            queryItems: [],
            body: nil,
            requiresAuth: true
        )
    }
}

