//
//  LogginInterceptor.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-25.
//

import Foundation

enum NetworkError: Error {
    case invalideURL
    case invalideResponse
    case statusCode(Int)
    case decoding(Error)
    case noInternet
    case timeout
    case unknown(Error)
}
