//
//  APIClient.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

final class APIClient: APIClientProtocol {
    func request<T: Decodable>(_ endpoint: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: endpoint)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
