//
//  LocationView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 12/29/21.
//

import SwiftUI

struct LocationView: View {
    
    let location: Location
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            Image(systemName: location.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(10)
                .background(Color(location.color))
                .clipShape(Circle())
            
            Text(location.title)
                .fixedSize()
                .padding(5)
                .background(.thinMaterial)
                .cornerRadius(5)
            
        }
        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 1)
        
    }
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location.example)
    }
}
