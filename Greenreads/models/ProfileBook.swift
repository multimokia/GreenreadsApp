//
//  ProfileBook.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ProfileBook {
    let id: Int8?
    let profileId: UUID
    let bookId: Int8
    let rating: Int8
    let createdAt: Date
    let updatedAt: Date?
    let deletedAt: Date?
}
