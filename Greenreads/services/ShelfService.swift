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
            values: ShelfBook(shelfId: shelfId, bookId: bookId)
        )

    do {
        return try await insertQuery.execute().value;
    }

    catch {
        print("Error inserting into shelf_book: \(error)");
    }

    return;
}

func removeBookFromShelf(bookId: Int, shelfId: Int) async -> ShelfBook {
    let query = client.database.from("shelf_book")
        .delete(returning: .representation)
        .match(query: [ "book_id": bookId, "shelf_id": shelfId ])
        .select()
        .single();

    let resp: ShelfBook = try! await query.execute().value;
    return resp;
}

func createShelf(name: String) async -> Shelf {
    let query = client.database.from("shelves")
        .insert(values: Shelf(name: name))


    let resp: Shelf = try! await query.execute().value;
    return resp;
}

func deleteShelf(shelfId: Int) async -> Shelf {
    let query = client.database.from("shelves")
        .delete()
        .match(query: [ "id": shelfId ]);

    let resp: Shelf = try! await query.execute().value;
    return resp;
}

func getShelvesWithBooks() async -> [ShelfWithBooks] {
    do {
        let query = client.database.rpc(fn: "get_shelves_with_books")

        let resp: [ShelfWithBooks] = try await query.execute().value;
        print("resp: \(resp)")
        return resp;
    }

    catch {
        print("Error getting shelves with books: \(error)");
    }

    return [];
}
