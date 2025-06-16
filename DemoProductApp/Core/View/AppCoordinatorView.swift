//
//  AppCoordinatorView.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView(
                viewModel: ProductsListViewModel(
                    fetchProductsUseCase: DIContainer.shared.fetchProductsUseCase
                ),
                router: ProductListRouter(coordinator: coordinator)
            )
            .navigationDestination(for: ProductDestination.self) { destination in
                coordinator.buildView(for: destination)
            }
        }
        .environmentObject(coordinator)
        .onAppear {
            coordinator.setNavigationPathBinding($path)
        }
    }
}
