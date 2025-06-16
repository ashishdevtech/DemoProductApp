//
//  ProductsListView.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var viewModel: ProductsListViewModel
    @ObservedObject var router: ProductListRouter

    var body: some View {
        List(viewModel.products) { product in
            Button {
                router.goToDetail(for: product)
            } label: {
                HStack {
                    AsyncImage(url: URL(string: product.thumbnail)) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable().scaledToFill()
                        case .failure(_):
                            Color.red
                        default:
                            ProgressView()
                        }
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(product.title)
                        Text(product.price.currencyFormatted())
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            if viewModel.products.isEmpty {
                viewModel.loadProducts()
            }
        }
        .navigationTitle("Products")
    }
}
