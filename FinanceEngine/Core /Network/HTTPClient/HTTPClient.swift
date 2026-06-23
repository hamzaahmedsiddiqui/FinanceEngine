//
//  HTTPClient.swift
//  FinanceEngine
//
//  Created by hamza Ahmed on 2026-05-25.
//

import Foundation

protocol HTTPClientProtocol {
    
    func request<Response: Decodable>(endpoint: Endpoint<Response>) async throws -> Response
}

final class HTTPClient: HTTPClientProtocol {
    private let session: URLSession
    private let requestBuilder: RequestBuilderProtocol
    
    init(session: URLSession, requestBuilder: RequestBuilderProtocol) {
        self.session = session
        self.requestBuilder = requestBuilder
    }
    
    func request<Response: Decodable>( endpoint: Endpoint<Response> ) async throws -> Response {
        
        // request builder build request using endpoints
        let request = try requestBuilder.build(from: endpoint)
        
        // urlsession to check if getting response from endpoint
        let (data, response) = try await session.data(for: request)
        
        // checking if http response is there
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // checking response status
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
        
        //  decoding data
        do {
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try JSONDecoder().decode(Response.self, from: data)
            
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
