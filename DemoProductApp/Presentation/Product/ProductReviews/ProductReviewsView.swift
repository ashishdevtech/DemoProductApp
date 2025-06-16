//
//  ProductReviewsView.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

struct ProductReviewsView: View {
    @StateObject var viewModel: ProductReviewsViewModel

    var body: some View {
        List(viewModel.reviews) { review in
            VStack(alignment: .leading, spacing: 4) {
                Text(review.reviewerName)
                    .font(.subheadline)
                    .bold()

                Text("⭐️ \(review.rating)")
                    .font(.caption)

                Text(review.comment)
                    .font(.body)

                Text(review.date)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 6)
        }
        .navigationTitle("Reviews")
    }
}
