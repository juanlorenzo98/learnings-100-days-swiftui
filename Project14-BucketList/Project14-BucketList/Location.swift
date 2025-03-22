//
//  Location.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
