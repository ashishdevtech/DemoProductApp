//
//  AppCoordinator.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    private var pathBinding: Binding<NavigationPath>?

    func setNavigationPathBinding(_ binding: Binding<NavigationPath>) {
        self.pathBinding = binding
    }

    @MainActor
    func buildView(for destination: ProductDestination) -> some View {
        switch destination {
        case .productDetail(let product):
            let viewModel = ProductDetailViewModel(product: product)
            return ProductDetailView(viewModel: viewModel)
        }
    }

}

extension AppCoordinator: ProductCoordinator {
    func push(_ destination: ProductDestination) {
        pathBinding?.wrappedValue.append(destination)
    }

    func pop() {
        pathBinding?.wrappedValue.removeLast()
    }

    func popToRoot() {
        pathBinding?.wrappedValue.removeLast(pathBinding?.wrappedValue.count ?? 0)
    }
}

///////////////////
///
import SwiftUI

enum NewProductDestination: Hashable {
    case productList
    case productDetail(Product)
//    case productReviews(Product)
//    case editProduct(Product)
//    case addProduct
}


class NewAppCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func start() -> some View {
        ProductListCoordinator().start()
    }
}

import SwiftUI

class ProductListCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()

    func start() -> some View {
        let viewModel = ProductViewModel(fetchProductsUseCase: DIContainer().fetchProductsUseCase)
        return NewProductListView(viewModel: viewModel, coordinator: self)
    }

    func showProductDetail(for product: Product) {
        navigationPath.append(product)
    }
}

import SwiftUI

class ProductDetailCoordinator: ObservableObject {
    private let product: Product

    init(product: Product) {
        self.product = product
    }

    func start() -> some View {
        let viewModel = ProductDetailViewModel(product: product)
        return NewProductDetailView(viewModel: viewModel, coordinator: self)
    }

//    func showReviews() -> some View {
//        ReviewsCoordinator(product: product).start()
//    }
//
//    func editProduct() -> some View {
//        EditProductCoordinator(product: product).start()
//    }
}
