//
//  AnyEncodable.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-25.
//

import Foundation

struct AnyEncodable: Encodable {
    
    private let encodeClosure: (Encoder) throws -> Void
    
    init<T: Encodable>(_ wrapped: T) {
        encodeClosure = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try encodeClosure(encoder)
    }
}


