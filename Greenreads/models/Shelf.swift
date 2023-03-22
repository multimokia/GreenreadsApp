//
//  Book.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-21.
//

import Foundation

struct Book: Encodable, Decodable {
    let id: Int?;
    let profile_id: UUID?;
    let name: String;
    let created_at: Date?;
    let updated_at: Date?;
    let deleted_at: Date?;
}
