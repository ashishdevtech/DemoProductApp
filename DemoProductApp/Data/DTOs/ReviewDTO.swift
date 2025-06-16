//
//  ReviewDTO.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

import Foundation

struct ReviewDTO: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String

    func toDomainModel() -> Review {
        Review(
            rating: rating,
            comment: comment,
            date: date,
            reviewerName: reviewerName,
            reviewerEmail: reviewerEmail
        )
    }
}
