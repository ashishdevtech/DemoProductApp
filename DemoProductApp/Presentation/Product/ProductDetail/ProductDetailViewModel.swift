//
//  ProductDetailViewModel.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var product: Product

    init(product: Product) {
        self.product = product
    }
}
