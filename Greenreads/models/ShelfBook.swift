//
//  ShelfBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ShelfBook {
    let id: Int8
    let shelfId: Int8
    let bookId: Int8
    let createdAt: Date
    let updatedAt: Date?
    let deletedAt: Date?
}

extension ShelfBook {
    static let id = Field<Int8>("id")
    static let shelfId = Field<Int8>("shelf_id")
    static let bookId = Field<Int8>("book_id")
    static let createdAt = Field<Date>("created_at")
    static let updatedAt = Field<Date?>("updated_at")
    static let deletedAt = Field<Date?>("deleted_at")
}
