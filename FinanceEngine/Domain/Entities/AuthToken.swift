//
//  AuthToken.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation

struct AuthToken {
    let accessToken: String
    let refreshToken: String
    let userId: String
    let expiresIn: Int
}
