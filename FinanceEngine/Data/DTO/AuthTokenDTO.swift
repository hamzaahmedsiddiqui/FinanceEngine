//
//  AuthTokenDTO.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-06-24.
//

import Foundation
struct AuthTokenDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let userId: String
    let expiresIn: Int
}


extension AuthTokenDTO {
    func toDomain () -> AuthToken {
        AuthToken(
            accessToken: accessToken,
            refreshToken: refreshToken,
            userId: userId,
            expiresIn: expiresIn
        )
    }
}
