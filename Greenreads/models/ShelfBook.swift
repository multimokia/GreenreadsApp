//
//  ShelfBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ShelfBook: Encodable, Decodable {
    let id: Int8?
    let shelfId: Int8
    let bookId: Int8
    let createdAt: Date?
    let updatedAt: Date?
    let deletedAt: Date?

    init(shelfId: Int, bookId: Int) {
        self.shelfId = Int8(shelfId);
        self.bookId = Int8(bookId);
        self.id = nil;
        self.createdAt = nil;
        self.updatedAt = nil;
        self.deletedAt = nil;
    }
}
