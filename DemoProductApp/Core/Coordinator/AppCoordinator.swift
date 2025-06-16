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
            let viewModel = ProductDetailViewModel(product: product, coordinator: self)
            return ProductDetailView(viewModel: viewModel).eraseToAnyView()

        case .productReviews(let reviews):
            let viewModel = ProductReviewsViewModel(reviews: reviews)
            return ProductReviewsView(viewModel: viewModel).eraseToAnyView()
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
