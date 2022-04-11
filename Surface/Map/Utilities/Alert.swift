//
//  Alert.swift
//  Surface
//
//  Created by Brandon Rodriguez on 4/10/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    
    static let restricted = AlertItem(title: Text("Access Restricted"), message: Text("Please enable location services in order for Surface to work as intended."), dismissButton: .default(Text("OK")))
    
    static let denied = AlertItem(title: Text("Access Denied"), message: Text("You have denied location permission. Go into app settings in order to change it."), dismissButton: .default(Text("OK")))
    
    static let unknownDefault = AlertItem(title: Text("Error"), message: Text("Please try again later."), dismissButton: .default(Text("OK")))
        
}
