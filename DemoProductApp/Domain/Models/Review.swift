//
//  Review.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

struct Review: Identifiable, Hashable {
    var id: String { reviewerEmail + date }
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}
