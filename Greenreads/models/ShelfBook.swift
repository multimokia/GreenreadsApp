//
//  ShelfBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ShelfBook: Encodable, Decodable {
    let id: Int8?
    let shelf_id: Int8
    let book_id: Int8
    let created_at: Date?
    let updated_at: Date?
    let deleted_at: Date?

    init(shelfId: Int, bookId: Int) {
        self.shelf_id = Int8(shelfId);
        self.book_id = Int8(bookId);
        self.id = nil;
        self.created_at = nil;
        self.updated_at = nil;
        self.deleted_at = nil;
    }
}
