//
//  ColorSelectionManager.swift
//  Surface
//
//  Created by Brandon Rodriguez on 4/10/22.
//

import Foundation

enum ColorSelectionManager: String, CaseIterable, Identifiable {
    
    case cyan = "Cyan"
    case orange = "Orange"
    case red = "Red"
    case purple = "Purple"
    case brown = "Brown"
    case yellow = "Yellow"
    case pink = "Pink"
    
    var id: RawValue { rawValue }
    
}
