//
//  ProfileShelf.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-03-21.
//

import Foundation

struct ProfileShelf {
    let id: Int8
    let profileId: UUID
    let shelfId: Int8
    let createdAt: Date
    let updatedAt: Date?
    let deletedAt: Date?
}

extension ProfileShelf {
    static let id = Field<Int8>("id")
    static let profileId = Field<UUID>("profile_id")
    static let shelfId = Field<Int8>("shelf_id")
    static let createdAt = Field<Date>("created_at")
    static let updatedAt = Field<Date?>("updated_at")
    static let deletedAt = Field<Date?>("deleted_at")
}
