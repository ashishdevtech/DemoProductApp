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
            VStack(spacing: SizeConstants.spacing) {
                thumbnailView(name: viewModel.thumbnail)
                titleView(title: viewModel.title)
                descriptionView(description: viewModel.description)
                Button {
                    
                } label: {
                    
                }

            }
            .padding()
        }
        .navigationTitle(StringConstants.productDetailTitle)
    }
}

extension ProductDetailView {
    enum SizeConstants {
        static let spacing: CGFloat = 16
        static let imageHeight: CGFloat = 200
        static let imageCornerRadius: CGFloat = 12
    }
    
    func thumbnailView(name: String) -> some View {
        AsyncImage(url: URL(string: name)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                Color.red
            default:
                ProgressView()
            }
        }
        .frame(height: SizeConstants.imageHeight)
        .cornerRadius(SizeConstants.imageCornerRadius)
    }
    
    func titleView(title: String) -> some View {
        Text(title)
            .font(.title)
    }
    
    func priceView(price: Double) -> some View {
        Text(price.currencyFormatted())
            .font(.headline)
    }
    
    func descriptionView(description: String) -> some View {
        Text(description)
            .font(.body)
    }
}

///////////////////
///
struct NewProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    var coordinator: ProductDetailCoordinator

    var body: some View {
        VStack(spacing: 16) {
            // Existing product details UI...

            Button("See Reviews") {
//                coordinator.showReviews(for: viewModel.product)
            }
            .padding()

            Button("Edit Product") {
//                coordinator.editProduct(viewModel.product)
            }
            .padding()
        }
        .navigationTitle("Product Detail")
    }
}
