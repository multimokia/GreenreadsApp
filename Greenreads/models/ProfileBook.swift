//
//  ProfileBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ProfileBook {
    let id: Int8
    let profileId: UUID
    let bookId: Int8
    let rating: Int8
    let createdAt: Date
    let updatedAt: Date?
    let deletedAt: Date?
}

extension ProfileBook {
    static let id = Field<Int8>("id")
    static let profileId = Field<UUID>("profile_id")
    static let bookId = Field<Int8>("book_id")
    static let rating = Field<Int8>("rating")
    static let createdAt = Field<Date>("created_at")
    static let updatedAt = Field<Date?>("updated_at")
    static let deletedAt = Field<Date?>("deleted_at")
}

//note
//the ProfileBook struct represents a row in the profile_books table, with properties that match the table's columns.
//The Field extensions provide easy access to the column names as strings.
//You can use this model with a database library such as Fluent to interact with the profile_books table in your Swift code.
