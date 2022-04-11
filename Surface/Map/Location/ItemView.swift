//
//  ItemView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/4/22.
//

import SwiftUI

struct ItemView: View {
    
    var item: Item
    
    var body: some View {
        
        Circle()
            .frame(width: 25, height: 25)
            .foregroundColor(Color(item.color))
            .shadow(color: Color(item.color).opacity(0.5), radius: 3, y: 1)
        
        Text(item.title)
        
    }
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item.example)
    }
}
