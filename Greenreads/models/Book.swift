//
//  Book.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-21.
//

import Foundation

struct Book: Encodable, Decodable {
    let id: Int?;
    let title: String;
    let author: String;
    let ISBN: String?;
    let publication_date: Date;
    let cover_image: String?;
    let summary: String;
    let rating: Float;
    let created_at: Date?;
    let updated_at: Date?;
    let deleted_at: Date?;
}
