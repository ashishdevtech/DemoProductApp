//
//  ProductRouter.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

enum ProductDestination: Hashable {
    case productDetail(product: Product)
}

final class ProductListRouter: ObservableObject {
    private let coordinator: ProductCoordinator

    init(coordinator: ProductCoordinator) {
        self.coordinator = coordinator
    }

    func goToDetail(for product: Product) {
        coordinator.push(.productDetail(product: product))
    }
}

