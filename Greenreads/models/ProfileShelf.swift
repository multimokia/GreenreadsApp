//
//  ProfileShelf.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ProfileShelf {
    let id: Int8?
    let profileId: UUID
    let shelfId: Int8
    let createdAt: Date
    let updatedAt: Date?
    let deletedAt: Date?
}

