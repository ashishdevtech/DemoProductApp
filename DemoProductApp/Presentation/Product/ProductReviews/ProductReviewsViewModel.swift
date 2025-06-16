//
//  ProductReviewsViewModel.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

final class ProductReviewsViewModel: ObservableObject {
    @Published var reviews: [Review]

    init(reviews: [Review]) {
        self.reviews = reviews
    }
}
