//
//  Reticle.swift
//  Surface
//
//  Created by Brandon Rodriguez on 4/10/22.
//

import SwiftUI

struct Reticle: View {
    
    var body: some View {
        
        Circle()
            .fill(.blue)
            .opacity(0.3)
            .frame(width: 32, height: 32)
        
    }
    
}


struct Reticle_Previews: PreviewProvider {
    static var previews: some View {
        Reticle()
    }
}
