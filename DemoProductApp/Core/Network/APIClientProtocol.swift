//
//  APIClientProtocol.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ endpoint: URLRequest) async throws -> T
}
