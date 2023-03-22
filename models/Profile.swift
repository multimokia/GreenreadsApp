//
//  Profiles.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-21.
//

import Foundation

struct Profile: Encodable, Decodable {
    let id: UUID?;
    let first_name: String;
    let last_name: String;
    let email: String;
    let username: String;
    let gender: String;
    let is_over_18: Bool;
    let created_at: Date?;
    let updated_at: Date?;
    let deleted_at: Date?;
}

