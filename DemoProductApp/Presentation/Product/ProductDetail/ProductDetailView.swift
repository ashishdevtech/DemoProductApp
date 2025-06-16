//
//  ProductDetailView.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: viewModel.product.thumbnail)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit)
                    case .failure(_):
                        Color.red
                    default:
                        ProgressView()
                    }
                }
                .frame(height: 200)
                .cornerRadius(12)

                Text(viewModel.product.title)
                    .font(.title)

                Text(viewModel.product.price.currencyFormatted())
                    .font(.headline)

                Text(viewModel.product.description)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Product Detail")
    }
}
