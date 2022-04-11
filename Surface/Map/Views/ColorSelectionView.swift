//
//  ColorSelectionView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/4/22.
//

import SwiftUI

struct ColorSelectionView: View {
    
    @Binding var color: String
    
    let colorColumns = [
    
        GridItem(.adaptive(minimum: 44))
    
    ]
    
    var body: some View {
        
        LazyVGrid(columns: colorColumns) {
            
            ForEach(ColorSelectionManager.allCases, id: \.self) { item in
                
                ZStack {
                    
                    Color(item.rawValue)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                        .shadow(color: Color(item.rawValue).opacity(0.5), radius: 3, y: 1)
                    
                    if item.rawValue == color {
                        
                        Image(systemName: SFSymbols.checkMarkCircle)
                            .font(.largeTitle)
                        
                    }
                    
                }
                .onTapGesture {
                    
                    color = item.rawValue
                    
                }
                
            }
            
        }
        .padding(.vertical)
        
    }
    
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView(color: .constant("Cyan"))
    }
}
