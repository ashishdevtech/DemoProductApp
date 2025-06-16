//
//  TestAppCoordinator.swift
//  DemoProductAppTests
//
//  Created by Ashish Pal on 16/06/25.
//

import XCTest
import SwiftUI
@testable import DemoProductApp

final class AppCoordinatorTests: XCTestCase {
    var coordinator: AppCoordinator!
    var navigationPath: NavigationPath!
    var pathBinding: Binding<NavigationPath>!

    override func setUp() {
        super.setUp()
        coordinator = AppCoordinator()
        navigationPath = NavigationPath()
        pathBinding = Binding(get: { self.navigationPath }, set: { self.navigationPath = $0 })
        coordinator.setNavigationPathBinding(pathBinding)
    }

    func test_push_callsPushWithCorrectDestination() {
        // Arrange
        let spy = SpyCoordinator()
        let router = ProductListRouter(coordinator: spy)
        let product = Product.mock()

        // Act
        router.goToDetail(for: product)

        // Assert
        XCTAssertEqual(spy.pushedDestination, .productDetail(product: product))
    }

    func test_pop_removesLastFromPath() {
        // Given
        let product = Product.mock()
        let destination = ProductDestination.productDetail(product: product)
        navigationPath.append(destination)
        
        // When
        coordinator.pop()
        
        // Then
        XCTAssertEqual(navigationPath.count, 0)
    }

    func test_popToRoot_clearsAllDestinations() {
        // Given
        navigationPath.append(ProductDestination.productDetail(product: Product.mock()))
        navigationPath.append(ProductDestination.productDetail(product: Product.mock(id: 2)))
        
        // When
        coordinator.popToRoot()
        
        // Then
        XCTAssertEqual(navigationPath.count, 0)
    }

    @MainActor func test_buildView_returnsProductDetailView() {
        // Given
        let product = Product.mock()
        let destination = ProductDestination.productDetail(product: product)

        // When
        let view = coordinator.buildView(for: destination)

        // Then
        XCTAssertTrue(view is ProductDetailView)
    }
}

final class SpyCoordinator: ProductCoordinator {
    private(set) var pushedDestination: ProductDestination?

    func push(_ destination: ProductDestination) {
        pushedDestination = destination
    }

    func pop() {}
    func popToRoot() {}
}
