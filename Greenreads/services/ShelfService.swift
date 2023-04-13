//
//  ShelfService.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-04-12.
//

import Foundation

func getShelves() async -> [Shelf] {
    let query = client.database.from("shelves").select();

    let resp: [Shelf] = try! await query.execute().value;
    return resp;
}

func addBookToshelf(bookId: Int, shelfId: Int) async -> Void {
    let insertQuery = client.database
        .from("shelf_book")
        .insert(
            values: ShelfBook(shelfId: shelfId, bookId: bookId),
            returning: .representation
        )
        .select();

    let resp: [ShelfBook] = try! await insertQuery.execute().value;
}
