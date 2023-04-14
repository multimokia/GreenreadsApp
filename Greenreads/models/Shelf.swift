//
//  Book.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-21.
//

import Foundation

struct Shelf: Encodable, Decodable {
    let id: Int?;
    let profile_id: UUID?;
    let name: String;
    let created_at: Date?;
    let updated_at: Date?;
    let deleted_at: Date?;

    init(name: String) {
        self.id = nil;
        self.profile_id = nil;
        self.name = name;
        self.created_at = nil;
        self.updated_at = nil;
        self.deleted_at = nil;
    }
}
