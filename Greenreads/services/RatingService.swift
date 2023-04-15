//
//  RatingService.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-04-15.
//

import Foundation

struct RateBookParams: Codable {
    let b_id: Int;
    let r: Int;
}

func addRating(bookId: Int, rating: Int) async -> ProfileBook? {
    let query = client.database
        .rpc(
            fn: "rate_book",
            params: RateBookParams(b_id: bookId, r: rating)
        )
        .single();

    let resp: ProfileBook = try! await query.execute().value;
    return resp;
}

struct UpdateBookRating: Codable {
    let rating: Float;
}

func rateBook(bookId: Int, rating: Int) async -> Book? {
    let query = client.database
        .from("books")
        .update(values: UpdateBookRating(rating: Float(rating)), returning: .representation)
        .match(query: ["id": bookId ])
        .single();

    let resp: Book = try! await query.execute().value;
    return resp;
}
