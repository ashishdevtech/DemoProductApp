//
//  MainApp.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}

//@main
//struct ProductListApp: App {
//    @StateObject private var appCoordinator = NewAppCoordinator()
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack(path: $appCoordinator.navigationPath) {
//                appCoordinator.start()
//                    .navigationDestination(for: Product.self) { product in
//                        ProductDetailCoordinator(product: product).start()
//                    }
//            }
//        }
//    }
//}
