//
//  NetworkError.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decoding(Error)
    case noInternet
    case timeout
    case unknown(Error)
}
