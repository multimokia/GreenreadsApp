//
//  BookService.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-04-12.
//

import Foundation

func getBooks() async -> [Book] {
    let query = client.database.from("books").select();

    let resp: [Book] = try! await query.execute().value;
    return resp;
}

func getBook(bookId: Int) async -> Book? {
    let query = client.database.from("books")
        .select()
        .match(query: [ "id": bookId ]);

    let resp: Book? = try! await query.execute().value;
    return resp;
}
