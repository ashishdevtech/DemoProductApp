//
//  ProductRepositoryImpl.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation
import Combine

final class ProductRepositoryImpl: ProductRepository {
    private let apiClient: APIClientProtocol
    private let baseURL = URL(string: APIConstants.baseURL + APIConstants.productsEndpoint)!

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchProducts() -> AnyPublisher<[Product], Error> {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"

        return apiClient.request(request, responseType: ProductResponseDTO.self)
            .map { $0.toDomainModel() }
            .eraseToAnyPublisher()
    }
}
