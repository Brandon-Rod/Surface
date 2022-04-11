//
//  SFSymbolManager.swift
//  Surface
//
//  Created by Brandon Rodriguez on 4/10/22.
//

import Foundation

enum SFSymbolManager: String, CaseIterable, Identifiable {

    case list = "list.dash"
    case lightBulb = "lightbulb.fill"
    case cart = "cart.fill"
    case sparkles = "sparkles"
    case star = "star.fill"
    case heart = "heart.fill"
    
    var id: RawValue { rawValue }
    
}
