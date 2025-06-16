//
//  ProductsListViewModel.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

@MainActor
final class ProductsListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false

    private let fetchProductsUseCase: FetchProductsUseCase

    init(fetchProductsUseCase: FetchProductsUseCase) {
        self.fetchProductsUseCase = fetchProductsUseCase
    }

    func loadProducts() async {
        isLoading = true
        do {
            products = try await fetchProductsUseCase.execute()
        } catch {
            print("Failed to fetch products: \(error)")
        }
        isLoading = false
    }
}
