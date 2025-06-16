//
//  ProductAPI.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

protocol ProductAPIProtocol {
    func fetchProducts() async throws -> [Product]
}

final class ProductAPI: ProductAPIProtocol {
    private let apiClient: APIClientProtocol
    private let baseURL = URL(string: APIConstants.baseURL + APIConstants.productsEndpoint)!

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchProducts() async throws -> [Product] {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        let dto: ProductResponseDTO = try await apiClient.request(request)
        return dto.toDomainModel()
    }
}
