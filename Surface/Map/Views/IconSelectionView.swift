//
//  IconSelectionView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/4/22.
//

import SwiftUI

struct IconSelectionView: View {
    
    @Binding var icon: String
    @Binding var color: String
    
    let iconColumns = [
    
        GridItem(.adaptive(minimum: 44))
    
    ]
    
    var body: some View {
        
        LazyVGrid(columns: iconColumns) {
            
            ForEach(SFSymbolManager.allCases, id: \.self) { object in
                
                VStack(spacing: 5) {
                    
                    Image(systemName: object.rawValue)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(color))
                        .frame(width: 30, height: 30)
                    
                    Divider()
                    
                    if object.rawValue == icon {
                        
                        Image(systemName: SFSymbols.checkMarkCircle)
                            .foregroundColor(Color(color))
                            .font(.largeTitle)
                        
                    } else {
                        
                        Image(systemName: SFSymbols.circle)
                            .foregroundColor(Color(color))
                            .font(.largeTitle)
                        
                    }
                    
                }
                .padding(5)
                .cornerRadius(10)
                .onTapGesture { icon = object.rawValue }
                
            }
            
        }
        
    }
    
}

struct IconSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        IconSelectionView(icon: .constant("list.dash"), color: .constant("Cyan"))
    }
}
