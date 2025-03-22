//
//  Location.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    #if DEBUG
    static let example = Location(id: UUID(), name: "custom", description: "customized", latitude: 136, longitude: 34)
    #endif
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
