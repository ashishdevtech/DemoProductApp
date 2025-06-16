//
//  ProductDetailViewModel.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    private let coordinator: ProductCoordinator

    init(product: Product, coordinator: ProductCoordinator) {
        self.product = product
        self.coordinator = coordinator
    }

    func goToReviews() {
        coordinator.push(.productReviews(reviews: product.reviews))
    }
}
