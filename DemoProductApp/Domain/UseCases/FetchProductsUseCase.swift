//
//  FetchProductsUseCase.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

protocol FetchProductsUseCase {
    func execute() async throws -> [Product]
}

final class FetchProductsUseCaseImpl: FetchProductsUseCase {
    private let api = ProductAPI()

    func execute() async throws -> [Product] {
        return try await api.fetchProducts()
    }
}
