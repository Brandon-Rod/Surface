//
//  Location.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/2/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    
    var id: UUID
    var title: String
    var icon: String
    var color: String
    var latitude: Double
    var longitude: Double
    var items: [Item]
    
    var coordinate: CLLocationCoordinate2D {
        
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    static let example = Location(id: UUID(), title: "Test Name", icon: "list.dash", color: "Cyan", latitude: 37.06204, longitude: 120.83967, items: [Item(id: UUID(), title: "Title", color: "Cyan")])
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        
        lhs.id == rhs.id
        
    }
    
}

struct Item: Identifiable, Codable, Equatable {
    
    var id: UUID
    var title: String
    var color: String
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        
        lhs.id == rhs.id
        
    }
    
    static let example = Item(id: UUID(), title: "Random Title", color: "Red")
    
}
