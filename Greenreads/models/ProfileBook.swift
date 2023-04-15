//
//  ProfileBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ProfileBook {
    let id: Int8?
    let profile_id: UUID
    let book_id: Int8
    let rating: Int8
    let created_at: Date
    let updated_at: Date?
    let deleted_at: Date?
}
